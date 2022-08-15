function RATE_PARAMS = SET_RATE_PARAMS_R(rate_tmp)
    switch(rate_tmp)
        case ['1';'1';'0';'1']
            nbpsc = 1;
            ncbps = 48;
            ndbps = 24;
        case ['0';'1';'0';'1']
            nbpsc = 2;
            ncbps = 96;
            ndbps = 48;
        case ['1';'0';'0';'1']
            nbpsc = 4;
            ncbps = 192;
            ndbps = 96;
        otherwise
            disp('Error - RATE');
    end
    RATE_PARAMS = struct('NBPSC', nbpsc, 'NCBPS', ncbps, 'NDBPS', ndbps);

end
