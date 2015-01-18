function [proc_results, proc_perf, results, perf] = validate_feature_network(net, T, Pt)

    % Pt : test inputs
   
    disp(sprintf('\tValidating Feature Network'));
    
    results = net(Pt);
    perf = perform(net, T, results);
    
    proc_results = round(results);
    proc_results(proc_results < 0) = 0;
    proc_perf = perform(net, T, proc_results);

end
