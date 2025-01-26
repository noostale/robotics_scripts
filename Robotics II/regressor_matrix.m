function Y = regressor_matrix(arg, a_vector)
    % Compute the regressor matrix of a given vector
    % INPUTS:
    % arg: the function to compute the regressor matrix
    % a_vector: the vector to compute the regressor matrix
    % OUTPUTS:
    % Y: the regressor matrix of the given vector

    Y = simplify(jacobian(arg, a_vector));
    disp('The regressor matrix is: ');
    disp(Y);
    
    end
