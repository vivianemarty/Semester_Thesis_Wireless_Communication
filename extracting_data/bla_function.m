%% function non-deterministic distributions
function all_anchors = bla_function(data_sigma,mannequin,selected_anchor,posture_index_start,posture_index_end)
% :returns: all_anchors
    counter = 1;
    if strcmp(mannequin,'Fiona')
        for i = posture_index_start:posture_index_end
            all_anchors(counter) = data_sigma.SingleLayerFiona{i,2}(1,selected_anchor);   
            counter = counter + 1;
        end
    else
        for i = posture_index_start:posture_index_end
            all_anchors(counter) = data_sigma.SingleLayerMartin{i,2}(1,selected_anchor);   
            counter = counter + 1;
        end
    end
end
