addpath("../util")
addpath("../ShaubUtils")

Mars = Planet(3396.19, 42828.3);

GMO = Spacecraft(17028.01, deg2rad(0), deg2rad(0), deg2rad(250), Mars);

LMO = Spacecraft(400, deg2rad(20), deg2rad(30), deg2rad(60), Mars);
LMO.inertia = [10, 0, 0; 0, 5, 0; 0, 0, 7.5];
LMO.init_att = [0.3;-0.4;0.5];
LMO.init_rot = deg2rad([1.00; 1.75; -2.20]);
LMO.target_craft = GMO;