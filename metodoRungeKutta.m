function [z_next, v_next] = metodoRungeKutta(z, v, dt, a_func)
    k1z = v;
    k1v = a_func(z, v);

    k2z = v + 0.5*dt*k1v;
    k2v = a_func(z + 0.5*dt*k1z, v + 0.5*dt*k1v);

    k3z = v + 0.5*dt*k2v;
    k3v = a_func(z + 0.5*dt*k2z, v + 0.5*dt*k2v);

    k4z = v + dt*k3v;
    k4v = a_func(z + dt*k3z, v + dt*k3v);

    z_next = z + (dt / 6) * (k1z + 2*k2z + 2*k3z + k4z);
    v_next = v + (dt / 6) * (k1v + 2*k2v + 2*k3v + k4v);
end