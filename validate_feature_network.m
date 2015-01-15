function [classes, perf, results] = validate_feature_network(net, T, Pt)

    % Pt : test inputs
   
    disp(sprintf('\tValidating Feature Network'));
        
    %{
    num_blocks = 100;
    ind = 1;
    i = 1;
    [~, num_images] = size(T);
    ind_step = floor(num_images/num_blocks);
    perf = zeros(num_blocks, 1);
    
    while ind < num_images
        
        next_ind = ind + ind_step;
        if next_ind < num_images
            results(:, ind:next_ind) = net(Pt(:,ind:next_ind));
            perf(i) = perform(net, T(:,ind:next_ind), results(:,ind:next_ind));
        else
            results(:, ind:num_images) = net(Pt(:, ind:num_images));
            perf(i) = perform(net, T(:,ind:end), results(:,ind:end));
        end

        ind = next_ind;
        i = i + 1;
    end
    %}
    
    results = net(Pt);
    perf = perform(net, T, results);
    classes = vec2ind(results);

end
