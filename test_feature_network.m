function [classes, results] = test_feature_network(net, Pt)

    % Pt : test inputs
   
    disp('\tTesting Feature Network');
        
    num_blocks = 100;
    ind = 1;
    [~, num_images] = size(Pt);
    ind_step = floor(num_images/num_blocks);
    
    while ind < num_images
        
        next_ind = ind + ind_step;
        if next_ind < num_images
            results(:, ind:next_ind) = net(Pt(:,ind:next_ind));
        else
            results(:, ind:num_images) = net(Pt(:, ind:num_images));
        end

        ind = next_ind;
    end
    
    classes = vec2ind(results);
    
end

