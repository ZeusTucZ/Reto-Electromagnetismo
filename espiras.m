function [Px, Py, Pz, dx, dy, dz] = espiras(ne, N, radio)
    dtheta = (2*pi)/N;
    angulo = 0:dtheta:(2*pi - dtheta);
    s = 1;
    h = 1;
    for i = 1:ne
        Px(s:s + N - 1) = radio * cos(angulo);
        Py(s:s + N - 1) = radio * sin(angulo);
        Pz(s:s + N - 1) = -ne/2 * h + (i - 1) * h;
        dx(s:s + N - 1) = -Py(s:s + N - 1) * dtheta;
        dy(s:s + N - 1) =  Px(s:s + N - 1) * dtheta;
        s = s + N;
    end

    dz = zeros(1, N * ne);
    
    
    figure(1);
    quiver3(Px, Py, Pz, dx, dy, dz, 0.5, '-r', 'LineWidth', 2);
    view(-34, 33);
    title('Corriente en espiras');
    xlabel('x'); ylabel('y'); zlabel('z');
    axis equal;
    grid on;
end