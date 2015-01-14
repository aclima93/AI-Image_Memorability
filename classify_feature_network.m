function classes = classify_feature_network(T, Pt)

    % Pt : test inputs
   
    disp('Testing Feature Network');
    
    results = net(Pt);
    perf = perform(net, T, results);
    disp(perf);
    classes = vec2ind(results);
    

end
