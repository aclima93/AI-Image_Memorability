function [proc_results, results] = classify_mem_network(net, Pt)

    % P : training inputs
    % T : desired training outputs
    % Pt : test inputs
    
    disp(sprintf('\tTesting Memorability Network'));

    results = net(Pt);
    
    %%%%%%
    % Correct negative and over one values.
    %%%%%%
    proc_results = round(results);
    proc_results(results < 0) = 0;
    proc_results(results > 100) = 100;
 
end
