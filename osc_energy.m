function [potential,kinetic] = osc_energy(u, v, omega)
% Returns the potential and kinetic energy of an oscilating system
potential = 1/2 * omega.^2 * u.^2;
kinetic = 1/2 * v.^2;
end

