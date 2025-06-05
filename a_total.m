function a = a_total(z, v, Bz, z_axis, mag, gamma, m)
    delta = 0.005;
    Bz_forward = interp1(z_axis, Bz, z + delta, 'linear', 'extrap');
    Bz_backward = interp1(z_axis, Bz, z - delta, 'linear', 'extrap');
    dBz_dz = (Bz_forward - Bz_backward) / (2 * delta);

    % Calcula fuerza magnética y total
    Fm = -mag * dBz_dz;
    Ff = -gamma * v; % Nueva fuerza de fricción
    F = Fm + Ff - m * 9.81;
    a = F / m;
end