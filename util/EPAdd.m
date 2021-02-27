function b = EPAdd(b1, b2)
    bmat = [ b1(1),-b1(2),-b1(3),-b1(4);
            -b1(2), b1(1), b1(4),-b1(3);
            -b1(3),-b1(4), b1(1),-b1(2);
             b1(4),-b1(3),-b1(2), b1(1)];
    b = bmat*b2;
end