classdef Integrator
    properties
        dt
        spacecraft
    end
    
    methods
        function obj = Integrator(dt, spacecraft)
            obj.dt = dt;
            obj.spacecraft = spacecraft;
        end
        
        function data = Integrate(obj,X,controller,steps)
            
            I = obj.spacecraft.inertia;
            h = obj.dt;
            
            Xhist = [X];
            thist = [0];
            uhist = [];
            
            for step = 1:steps
                t = h*(step-1);
                u = controller.control(X,t);
                X = obj.RK4step(X,u,I,h);
                sigma = X(1:3);
                s_norm = norm(sigma,2);
                if s_norm > 1
                    sigma = -sigma / s_norm^2;
                    X(1:3) = sigma;
                end
                Xhist = [Xhist,X];
                uhist = [uhist, u];
                thist = [thist,h*step];
            end
            
            data = SimData(Xhist, uhist, thist, h);
        end
        
        function Xp = RK4step(obj,X,u,I,h)
            k1 = obj.F(X,u,I);
            k2 = obj.F(X+h.*(k1./2),u,I);
            k3 = obj.F(X+h.*(k2./2),u,I);
            k4 = obj.F(X+h.*k3,u,I);

            Xp = X + (1/6)*h*(k1 + 2*k2 + 2*k3 + k4);
        end
        
    end
    
    methods(Static)
        
        function dX = F(X,u,I)
            sigma = X(1:3);
            w = X(4:6);
            dw = I\(-tilde(w)*I*w + u);

            dsigma = (1/4)*BmatMRP(sigma)*w;

            dX = [dsigma;dw];
        end

        function u = nom_u(X,I)
            u = zeros(3,1);
        end
    end
end