classdef Planet
    properties
        R
        mu
    end
    
    methods
        function obj = Planet(R,mu)
            obj.R = R;
            obj.mu = mu;
        end
    end
end