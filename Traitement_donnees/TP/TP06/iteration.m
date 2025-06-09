function [x_new,y_new] = iteration(x,y,Fx,Fy,gamma,A)

    indices = sub2ind(size(Fx), round(y), round(x));
    Bx = -gamma * Fx(indices);
    By = -gamma * Fy(indices);

    x_new = A*x + Bx;
    y_new = A*y + By;

end

