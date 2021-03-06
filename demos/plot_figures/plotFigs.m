col = [0.3312 0.9525 0.251; 0.3551 0.6050 0.4211; 0.9970 0.3872 0.1841; 0.2242 0.1422 0.7258];

if grampa_ && scampi_
    for s = 1 : numel(subrateTab)
        
        figure(s);
        hold on;    
        for d = 1 : numel(isnrTab) - 1
             
            pl_grampa = [];
            pl_scampi = [];
            for m = 1 : numel(mismatchTab)         
                
                for o = 1 : numel(omegaTab)                
                    pl_grampa(o, m) = mean([results_grampa_nsnr{d, s, o, m, :} ] );
                    pl_scampi(o, m) = mean([results_scampi_nsnr{d, s, o, m, :} ] );                
                end            

                [pl_grampa_min(s, m), ind_grampa_min(s, m) ]  = min(pl_grampa(:, m) );
                [pl_scampi_min(s, m), ind_scampi_min(s, m) ] = min(pl_scampi(:, m) );
                [pl_grampa_max(s, m), ind_grampa_max(s, m) ] = max(pl_grampa(:, m) );
                [pl_scampi_max(s, m), ind_scampi_max(s, m) ] = max(pl_scampi(:, m) );
            end        
                
            pl{d} = plot(mismatchTab, pl_scampi_min(s, :), '-', 'color', col(d, :) );         
            set(pl{d}, 'lineWidth', 4);
            pl_ = plot(mismatchTab, pl_grampa_min(s, :), '--', 'color', col(d, :) );
            set(pl_, 'lineWidth', 3);
            leg{d} = ['ISNR=', num2str(isnrTab(d) ) ];                
        end

        ylabel('NSNR','Interpreter','latex');
        xlabel('mismatch $\gamma$','Interpreter','latex');     
        title([image_, sprintf(' %d %c %d, alpha=%0.2g', [sqrt(N), 'x', sqrt(N), subrateTab(s) ] ) ], 'Interpreter', 'latex');        
        set(gca,'xscale','log');
        legend([pl{:} ], leg, 'Location', 'NorthWest', 'Interpreter', 'latex');
        set(gca, 'Fontsize', 20);
    end

elseif grampa_ && not(scampi_)

    for s = 1 : numel(subrateTab)
        
        figure(s);
        hold on;    
        for d = 1 : numel(isnrTab) - 1
                     
            pl_grampa = [];
            for m = 1 : numel(mismatchTab)         
                
                for o = 1 : numel(omegaTab)                               
                    pl_grampa(o, m) = mean([results_grampa_nsnr{d, s, o, m, :} ] );                
                end            
                
                [pl_grampa_min(s, m), ind_grampa_min(s, m) ] = min(pl_grampa(:, m) );           
                [pl_grampa_max(s, m), ind_grampa_max(s, m) ] = max(pl_grampa(:, m) );
            end        
                
            pl{d} = plot(mismatchTab, pl_grampa_min(s, :), '-', 'color', col(d, :) );         
            set(pl{d}, 'lineWidth', 4);        
            leg{d} = ['ISNR=', num2str(isnrTab(d) ) ];                
        end

        ylabel('NSNR','Interpreter','latex');
        xlabel('mismatch $\gamma$','Interpreter','latex');     
        title([image_, sprintf(' %d %c %d, alpha=%0.2g', [sqrt(N), 'x', sqrt(N), subrateTab(s) ] ) ], 'Interpreter', 'latex');        
        set(gca,'xscale','log');
        legend([pl{:} ], leg, 'Location', 'NorthWest', 'Interpreter', 'latex');
        set(gca, 'Fontsize', 20);
    end

elseif not(grampa_) && scampi_

    for s = 1 : numel(subrateTab)
        
        figure(s);
        hold on;    
        for d = 1 : numel(isnrTab) - 1
                     
            pl_scampi = [];
            for m = 1 : numel(mismatchTab)         
                
                for o = 1 : numel(omegaTab)                               
                    pl_scampi(o, m) = mean([results_scampi_nsnr{d, s, o, m, :} ] );                
                end            
                
                [pl_scampi_min(s, m), ind_scampi_min(s, m) ] = min(pl_scampi(:, m) );           
                [pl_scampi_max(s, m), ind_scampi_max(s, m) ] = max(pl_scampi(:, m) );
            end        
                
            pl{d} = plot(mismatchTab, pl_scampi_min(s, :), '-', 'color', col(d, :) );         
            set(pl{d}, 'lineWidth', 4);        
            leg{d} = ['ISNR=', num2str(isnrTab(d) ) ];                
        end

        ylabel('NSNR','Interpreter','latex');
        xlabel('mismatch $\gamma$','Interpreter','latex');     
        title([image_, sprintf(' %d %c %d, alpha=%0.2g', [sqrt(N), 'x', sqrt(N), subrateTab(s) ] ) ], 'Interpreter', 'latex');        
        set(gca,'xscale','log');
        legend([pl{:} ], leg, 'Location', 'NorthWest', 'Interpreter', 'latex');
        set(gca, 'Fontsize', 20);
    end

end
    