function net = train_feature_network(num_features, P, T)

    % P : training inputs
    % T : desired training outputs
    % Pt : test inputs
    
    disp('Training Feature Network');
    
    net = patternnet(ceil(log2(num_features)));
    %net.trainParam.showWindow = false;
    
    num_blocks = 100;
    net = train(net, P, T,'useGPU','only','showResources','yes','reduction',num_blocks);
    %net = train(net, P, T,'reduction',num_blocks);
    
end
