function [root,error,iterations] = NewtonRaphson(initial_x,fun)

error = 1;
tolerance = 0.00001;
x = initial_x;
delta_x = 0.001;
iterations = 0;

while error > tolerance && iterations <100
    iterations = iterations + 1;
    est_grad = (fun(x+delta_x)-fun(x-delta_x))/(2*delta_x);
    x_new = x - fun(x)/est_grad;
    error = abs(x-x_new);
    x = x_new;
end

root = x;
end