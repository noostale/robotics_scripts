function [T, A] = DHMatrix(DHTABLE)
    % DHMatrix computes the homogeneous transformation matrix from a given 
    % Denavit-Hartenberg (DH) table.
    %
    % PARAMETERS:
    %   - DHTABLE: An Nx4 matrix where each row represents a DH parameter set
    %     in the order: [alpha, a, d, theta]
    %     * alpha: Link twist (angle between Zi-1 and Zi about Xi-1) [rad]
    %     * a: Link length (distance between Zi-1 and Zi along Xi-1) [m]
    %     * d: Link offset (distance between Xi-1 and Xi along Zi) [m]
    %     * theta: Joint angle (rotation around Zi) [rad]
    %
    % OUTPUT:
    %   - T: The cumulative transformation matrix from base to end-effector
    %   - A: A cell array containing individual transformation matrices for
    %        each row of the DH table
    %
    % USAGE EXAMPLE:
    %   DHTABLE = [0, 1, 0, pi/2; 0, 1, 0, 0]; 
    %   [T, A] = DHMatrix(DHTABLE);
    
        % Initialize transformation matrix as identity
        T = eye(4);
        
        % Get the number of rows in the DH table (number of joints)
        numJoints = size(DHTABLE, 1);
        
        % Preallocate cell array for individual transformation matrices
        A = cell(1, numJoints);
        
        for i = 1:numJoints
            % Extract DH parameters for joint i
            alpha = DHTABLE(i, 1); % Link twist
            a = DHTABLE(i, 2);     % Link length
            d = DHTABLE(i, 3);     % Link offset
            theta = DHTABLE(i, 4); % Joint angle
            
            % Compute the individual transformation matrix
            A{i} = [cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), a*cos(theta);
                    sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
                    0,           sin(alpha),            cos(alpha),            d;
                    0,           0,                     0,                     1];
            
            % Multiply to get the cumulative transformation matrix
            T = T * A{i};   
        end
    
        % Simplify if symbolic computation is detected
        if isa(T, 'sym')
            T = simplify(T);
        end
    end
    