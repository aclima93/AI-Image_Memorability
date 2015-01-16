function [trained_net] = train_mem_network(input, target)

    [num_features, num_images] = size(input);
    net = fitnet(ceil(log2(num_features)));
    
    %net = configure(net, input, target);
    
    net.trainParam.max_fail = 3000;
    net.trainParam.epochs = 10000;
    net.trainParam.showWindow = false;
    
    trained_net = train(net, input, target, 'useGPU', 'yes');
end

