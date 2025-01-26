function M = inertia_matrix_from_DH(dh_table, mass, inertia, P_CoM)
    % Computes the inertia matrix given the DH parameters, mass, and inertia tensors
    % 
    % Inputs:
    %   - dh_table: [n x 4] matrix of DH parameters [theta, d, a, alpha]
    %   - mass: [n x 1] vector of masses for each link
    %   - inertia: [3 x 3 x n] tensor containing inertia matrices of each link (at CoM)
    %   - P_CoM: [n x 3] matrix of CoM positions in local link frames
    % 
    % Output:
    %   - M: [n x n] Inertia matrix of the manipulator

    n = size(dh_table, 1); % Number of links
    syms q [1 n] real       % Generalized coordinates (joint variables)
    syms dq [1 n] real      % Generalized velocities
    
    % Compute transformation matrices
    T = sym(eye(4)); % Initialize transformation
    P_CoM_base = sym(zeros(3, n)); % CoM positions in the base frame
    Jv = sym(zeros(3, n, n)); % Linear velocity Jacobian
    Jw = sym(zeros(3, n, n)); % Angular velocity Jacobian
    
    for i = 1:n
        % Extract DH parameters
        theta = dh_table(i, 4);
        d = dh_table(i, 2);
        a = dh_table(i, 3);
        alpha = dh_table(i, 1);
        
        % Compute transformation matrix from frame i-1 to i
        T_i = [cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), a*cos(theta);
               sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
               0,           sin(alpha),           cos(alpha),           d;
               0,           0,                     0,                   1];

        % Update total transformation
        T = T * T_i;
        
        % Extract the rotation and translation from the transformation matrix
        R_i = T(1:3, 1:3); % Rotation matrix
        P_i = T(1:3, 4);   % Translation vector (origin of link i in base frame)

        % Compute CoM position in the base frame
        P_CoM_base(:, i) = P_i + R_i * P_CoM(i, :)'; % Transform CoM position
        
        % Compute linear and angular velocity Jacobians
        for j = 1:i
            if j == 1
                z_prev = [0; 0; 1]; % Base frame z-axis
                o_prev = [0; 0; 0]; % Base frame origin
            else
                z_prev = T(1:3, 3); % z-axis of the previous frame
                o_prev = T(1:3, 4); % Origin of the previous frame
            end
            % Linear velocity Jacobian computed at the CoM
            Jv(:, j, i) = cross(z_prev, (P_CoM_base(:, i) - o_prev));
            % Angular velocity Jacobian remains the same
            Jw(:, j, i) = z_prev;
        end
    end

    % Compute Inertia Matrix
    M = sym(zeros(n, n)); % Initialize inertia matrix
    
    for i = 1:n
        % Compute CoM displacement vector in base frame
        d_i = P_CoM_base(:, i); 

        % Apply parallel axis theorem to transform inertia tensor
        I_base = inertia(:, :, i) + mass(i) * (d_i' * d_i * eye(3) - (d_i * d_i'));

        % Compute kinetic energy contribution
        M = M + mass(i) * (Jv(:, :, i)' * Jv(:, :, i)) + Jw(:, :, i)' * I_base * Jw(:, :, i);
    end
    
    M = simplify(M); % Simplify the result
end
