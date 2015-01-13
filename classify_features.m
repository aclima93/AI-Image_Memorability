function res = classify_features(num_features, num_images, num_test_images, P, T, Pt)

    % P : training inputs
    % T : desired training outputs
    % Pt : test inputs
    
    %{    
    [~, ~, ~, N] = size(P);
    transfer_function = 'hardlim';
    learning_function = 'learnp';
    
    % initialize
    net = newp(P, T, transfer_function, learning_function);
    W = rand(num_features, N);
    b = rand(num_features, 1);
    net.IW{1, 1} = W;
    net.b{1, 1} = b;

    % training parameters
    net.performParam.ratio = 0.5; % learning rate 
    net.trainParam.epochs = 1000; % maximum epochs 
    net.trainParam.show = 35; % show 
    net.trainParam.goal = 1e-6; % goal=objective 
    net.performFcn = 'sse'; % criterion
    
    % training
    net = train(net, P, T);
    W = net.IW{1, 1};
    b = net.b{1, 1};
    
    % validation
    results = sim(net, Pt);
    %}
    
    disp('Training Feature Network');
    
    net = patternnet(10);%[ceil(log2(num_features))]);
    net.trainParam.showWindow = false;
    
    num_blocks = 100;
    %{
    ind = 1;
    ind_step = floor(num_images/num_blocks);
    while ind < num_images
        next_ind = ind + ind_step;
        if next_ind < num_images
            net = train(net, P(:, ind:next_ind), T(:, ind:next_ind), 'useGPU','yes','showResources','yes');%, 'reduction', num_blocks);
        else
            net = train(net, P(:, ind:end), T(:, ind:end), 'useGPU','yes','showResources','yes');%, 'reduction', num_blocks);
        end
        ind = next_ind;
    end
    %}
    net = train(net, P, T, 'reduction', num_blocks);%,'useGPU','only','showResources','yes'
    
    save net;
    
    disp('Testing Feature Network');
    
    results = net(Pt);
    
    % expected results
    %{
    ExpectedResults = abs(eye(num_features)-1);
    results = abs(results-1);
    [~,ExpectedResultsIndex] = min(ExpectedResults);
    [~,resultsIndex] = min(results);
    
    res = nnz(ExpectedResultsIndex == resultsIndex);
    %}
    res = -1;

end
