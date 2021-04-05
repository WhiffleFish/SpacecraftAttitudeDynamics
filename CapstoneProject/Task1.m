init
%%
pLMO = LMO.pos(450)

pGMO = GMO.pos(1150)

vLMO = Rdot(LMO,450)

vGMO = Rdot(GMO,1150)

function Nrdot = Rdot(craft, t)
    Nrdot = craft.NHDCM(t)*[0;craft.theta_dot*craft.r;0];
end