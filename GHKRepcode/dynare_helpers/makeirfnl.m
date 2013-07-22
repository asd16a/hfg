%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get IRFS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
reordered = lgy_;          % the vector reordered contains names of variables
                                            % corresponding to rows of
                                            % history

% this loop assigns each row of history to its variable
% it also assigns steady state values
% IRFs are stored under varname_irf  where varname is the variable name
% SS values are stored under varname
% NB: SS values are scalar, IRFs are column vectors.
nvars = size(reordered,1);
simdata = '';
for indxi = 1:nvars
    eval([dset,'_',deblank(lgy_(indxi,:)),'= ys_(indxi);']);
    eval([dset,'_',deblank(lgy_(indxi,:)),'_irf=',...
          deblank(lgy_(indxi,:)),'(2:nperiods+1)-ys_(indxi);']);
    simdata = [simdata,' ',dset,'_',deblank(lgy_(indxi,:)),' ',...
               dset,'_',deblank(lgy_(indxi,:)),'_irf'];
end


