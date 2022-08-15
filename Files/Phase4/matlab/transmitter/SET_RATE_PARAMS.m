function RATE_PARAMS = SET_RATE_PARAMS(rate_tmp)
    switch(rate_tmp)
        case 6
            nbpsc = 1;
            ncbps = 48;
            ndbps = 24;
        case 12
            nbpsc = 2;
            ncbps = 96;
            ndbps = 48;
        case 24
            nbpsc = 4;
            ncbps = 192;
            ndbps = 96;
        otherwise
            disp('Error - RATE');
    end
    RATE_PARAMS = struct('NBPSC', nbpsc, 'NCBPS', ncbps, 'NDBPS', ndbps);

end

