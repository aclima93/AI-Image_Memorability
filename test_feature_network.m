function [proc_results, results] = test_feature_network(net, Pt)

    % Pt : test inputs
   
    disp(sprintf('\tTesting Feature Network'));
    
    results = net(Pt);
    proc_results = round(results);
    proc_results(proc_results < 0) = 0;
    
end

