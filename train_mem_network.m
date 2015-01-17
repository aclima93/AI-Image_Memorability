function [trained_net] = train_mem_network(P, T)

    % P : training inputs
    % T : desired training outputs
    % Pt : test inputs
    
    disp(sprintf('\tTraining Memorability Network'));

    [num_features, num_images] = size(P);
    net = fitnet(ceil(log2(num_features)));
    
    %net = configure(net, input, target);
    
    net.trainParam.max_fail = 3000;
    net.trainParam.epochs = 10000;
    net.trainParam.showWindow = false;
    
    trained_net = train(net, P, T, 'useGPU', 'yes');
end

