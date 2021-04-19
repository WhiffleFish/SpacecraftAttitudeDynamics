classdef Controller
    properties
        K
        P
        craft
        target_func
    end
    
    methods
        function obj = Controller(K, P, craft, target_func)
            obj.K = K;
            obj.P = P;
            obj.craft = craft;
            obj.target_func = target_func;
        end
        
        function u = sun_track_control(obj, X, t)
            sigmaBN = X(1:3);
            omegaBN = X(4:6);
            
            BN = MRP2C(sigmaBN);
            BR = BN*obj.craft.RsNDCM(t)';
            sigmaBR = C2MRP(BR);
            
            omegaBR = omegaBN - BN*obj.craft.omegaRsN(t);
            u = - obj.K*sigmaBR - obj.P*omegaBR;
        end
        
        function u = gmo_track_control(obj, X, t)
            sigmaBN = X(1:3);
            omegaBN = X(4:6);
            target = obj.craft.target_craft;
            
            BN = MRP2C(sigmaBN);
            BR = BN*obj.craft.RcNDCM(target, t)';
            sigmaBR = C2MRP(BR);
            
            % MAY NEED TO SWITCH omegaRcN from N-frame to B-frame
            omegaBR = omegaBN - BN*obj.craft.omegaRcN(target, t);
            u = - obj.K*sigmaBR - obj.P*omegaBR;
        end
        
        function u = nadir_track_control(obj, X, t)
            sigmaBN = X(1:3);
            omegaBN = X(4:6);
            
            BN = MRP2C(sigmaBN);
            BR = BN*obj.craft.RnNDCM(t)';
            sigmaBR = C2MRP(BR);
            
            % omegaRnN is in N frame
            omegaBR = omegaBN - BN*obj.craft.omegaRnN(t);
            u = - obj.K*sigmaBR - obj.P*omegaBR;
        end
            
        function u = control(obj, X, t)
            target = obj.target_func(obj.craft,t);
            if isnumeric(target)
                u = target;
            elseif target == 's'
                u = obj.sun_track_control(X,t);
            elseif target == 'n'
                u = obj.nadir_track_control(X,t);
            elseif target == 'c'
                u = obj.gmo_track_control(X,t);
            else
                error("Invalid Target")
            end
        end
    end
end