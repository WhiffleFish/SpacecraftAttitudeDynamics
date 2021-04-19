classdef Spacecraft
    
    properties
        planet
        r
        h
        Omega
        i
        theta0
        theta_dot
        target_craft = NaN
        inertia = eye(3)
        init_att = zeros(3,1) % MRP (B/N)
        init_rot = zeros(3,1) % wrt body frame
        
    end
    
    methods
        function obj = Spacecraft(h, Omega, i, theta0, planet)
            obj.planet = planet;
            obj.r = h + planet.R;
            obj.h = h;
            obj.Omega = Omega;
            obj.i = i;
            obj.theta0 = theta0;
            obj.theta_dot = sqrt(planet.mu/obj.r^3);
        end
        
        function th = theta(obj, t)
            th = obj.theta0 + obj.theta_dot*t;
        end
        
        function C = HNDCM(obj,t)
            C = Euler3132C([obj.Omega; obj.i; obj.theta(t)]);
        end
        
        function C = NHDCM(obj, t)
            C = HNDCM(obj,t)';
        end
        
        function C = RsNDCM(obj, t)
            C = [-1,0,0;0,0,1;0,1,0];
        end
        
        function C = RnHDCM(obj, t)
            C = [-1,0,0;0,1,0;0,0,-1];
        end
        
        function C = RnNDCM(obj, t)
            C = obj.RnHDCM*obj.HNDCM(t);
        end
        
        function C = RcNDCM(obj, target_craft, t)
            dr = obj.deltar(target_craft, t);
            
            r1_hat = -dr ./ norm(dr,2);
            r2_hat = cross(dr,[0;0;1]) ./ norm(cross(dr,[0;0;1]),2);
            r3_hat = cross(r1_hat, r2_hat);
            
            C = [r1_hat';r2_hat';r3_hat'];
        end
        
        function omega = omegaRsN(obj, t)
            omega = [0;0;0];
        end
        
        function omega = omegaRnN(obj, t)
            omega = obj.NHDCM(t)*[0;0;obj.theta_dot];
        end
        
        function omega = omegaRcN(obj, target_craft, t)
            dt = 1e-3;
            C = obj.RcNDCM(target_craft,t);
            C_dot = (obj.RcNDCM(target_craft,t+dt) - obj.RcNDCM(target_craft,t-dt))/(2*dt);
            omega_tilde = -C_dot*transpose(C); % omega_tilde in Rc frame components
            omega = transpose(C)*vecfromtilde(omega_tilde);
        end
        
        function dr = deltar(obj, target_craft, t)
            dr = target_craft.pos(t) - obj.pos(t);
        end
        
        function p = pos(obj, t)
            % Return inertial frame coordinates at time t
            HN = obj.NHDCM(t);
            p = HN*[obj.r;0;0];
        end
        
        function x0 = X0(obj)
            x0 = [obj.init_att;obj.init_rot];
        end
    end
end