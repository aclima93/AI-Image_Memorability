function net = train_feature_network(num_features, P, T)

    % P : training inputs
    % T : desired training outputs
    % Pt : test inputs
    
    disp('Training Feature Network');
    [~,~,~,num_images] = size(P);
    num_neurons = ceil(log2(num_features));
    num_layers = 1;%ceil(log2(num_images));
    net = fitnet(repmat(num_neurons, 1, num_layers));
    net.trainParam.showWindow = false;
    
    num_blocks = 1;
    net = train(net, P, T,'useGPU','yes','showResources','yes');
    %net = train(net, P, T,'useGPU','yes','showResources','yes','reduction',num_blocks);
    %net = train(net, P, T,'useParallel','yes','showResources','yes','reduction',num_blocks);
    %net = train(net, P, T,'reduction',num_blocks);
    
end
