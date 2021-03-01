function BbarN = TRIAD(vBs,vNs)
    t1B = vBs(:,1);
    t2B = cross(vBs(:,1),vBs(2,:));
    t2B = t2B./norm(t2B,2);
    t3B = cross(t1B,t2B);

    t1N = vNs(:,1);
    t2N = cross(vNs(:,1),vNs(:,2));
    t2N = t2N./norm(t2N,2);
    t3N = cross(t1N,t2N);

    BbarT = [t1B t2B t3B];
    NT = [t1N t2N t3N];

    BbarN = BbarT*NT';
end