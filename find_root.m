function [root,error,iterations] = find_root(initial_x,fun)
error = 1;
tolerance = 0.0000001;
x = initial_x;
delta_x = 1.0001;
iterations = 0;
while error > tolerance && iterations < 10000
    iterations = iterations+1;
    y0 = fun(x);
    y1 = fun(x+delta_x);
    y2 = fun(x+2*delta_x);

    if y0/y1 < 0
        delta_x = delta_x/2;
        error = abs(delta_x/(x+delta_x));
    elseif y2/y1 < 0
        delta_x = delta_x/2;
        error = abs(delta_x/(x+delta_x));
        x = x+delta_x;
    else 
        x = x+2*delta_x;
    end
end

root = x;
end
