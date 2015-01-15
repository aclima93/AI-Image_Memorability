function net = train_feature_network(num_features, P, T)

    % P : training inputs
    % T : desired training outputs
    % Pt : test inputs
    
    disp('\tTraining Feature Network');
    [~,~,~,num_images] = size(P);
    num_neurons = ceil(log2(num_features));
    num_layers = 1;%ceil(log2(num_images));
    net = fitnet(repmat(num_neurons, 1, num_layers));
    net = configure(net, P, T);
    net.trainParam.showWindow = false;
    
    num_blocks = 10;
    %net = train(net, P, T,'useGPU','yes','showResources','yes');
    %net = train(net, P, T,'useGPU','yes','showResources','yes','reduction',num_blocks);
    %net = train(net, P, T,'useParallel','yes','showResources','yes','reduction',num_blocks);
    %net = train(net, P, T,'reduction',num_blocks);
    %net = train(net, P, T);
    
    ind = 1;
    ind_step = floor(num_images/num_blocks);
    
    while ind < num_images
        
        next_ind = ind + ind_step;
        if next_ind < num_images
            net = train(net, P(:,ind:next_ind), T(:,ind:next_ind),'useGPU','yes','showResources','yes');
        else
            net = train(net, P(:,ind:num_images), T(:,ind:num_images),'useGPU','yes','showResources','yes');
        end

        ind = next_ind;
    end
    
end
