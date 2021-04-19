classdef SimData
    properties
        X
        u
        t
        dt
    end
    
    methods
        function obj = SimData(X,u,t,dt)
            obj.X = X;
            obj.u = u;
            obj.t = t;
            obj.dt = dt;
        end
        
        function s = sigma(obj)
            s = obj.X(1:3,:);
        end
        
        function w = omega(obj)
            w = obj.X(4:6,:);
        end
        
        function idx = time_index(obj, t)
            if mod(t,obj.dt) ~= 0
                error('Input time must be divisible by integration time step')
            end
            idx = round(t/obj.dt) + 1;
        end
        
        function x = Xt(obj,t)
            x = obj.X(:,obj.time_index(t));
        end
        
        function plot(obj, which)
            figure()
            if which == "omega"
                plot(obj.t, obj.omega()', 'LineWidth',2)
                legend({'\omega_1','\omega_2','\omega_3'}, 'FontSize',12)
                title("Angular Rates", 'FontSize',15)
            elseif which == "sigma"
                plot(obj.t, obj.sigma()','LineWidth',2)
                legend({'\sigma_1','\sigma_2','\sigma_3'}, 'FontSize',12)
                title("Attitude", 'FontSize',15)
            else
                plot(obj.t, obj.X','LineWidth',2)
                legend({'\sigma_1','\sigma_2','\sigma_3','\omega_1','\omega_2','\omega_3'}, 'FontSize',12)
                title("Attitude & Angular Rates", 'FontSize',15)
            end
            xlabel("Time (s)")
        end
        
        function plot_c(obj, which)
            figure()
            subplot(2,1,1)
            if which == "omega"
                plot(obj.t, obj.omega()','LineWidth',2)
                legend({'\omega_1','\omega_2','\omega_3'}, 'FontSize',12)
                title("Angular Rates", 'FontSize',15)
            elseif which == "sigma"
                plot(obj.t, obj.sigma()','LineWidth',2)
                legend({'\sigma_1','\sigma_2','\sigma_3'}, 'FontSize',12)
                title("Attitude", 'FontSize',15)
            else
                plot(obj.t, obj.X','LineWidth',2)
                legend({'\sigma_1','\sigma_2','\sigma_3','\omega_1','\omega_2','\omega_3'}, 'FontSize',12)
                title("Attitude & Angular Rates", 'FontSize',15)
            end
            subplot(2,1,2)
            plot(obj.t(1:end-1),obj.u','LineWidth',2)
            legend({'u_1','u_2','u_3'}, 'FontSize',12)
            xlabel("Time (s)")
        end
    end
end