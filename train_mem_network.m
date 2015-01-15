function [trained_net] = train_mem_network(input, target)

    net = feedforwardnet(500, 'trainlm');
    
    net.trainParam.max_fail = 500;
    
    trained_net = train(net, input, target);
end

