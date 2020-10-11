function [ posture_index_start, posture_index_end ] = get_posture_indices( mannequin, posture )
% This function computes the start and end indices of the currently treated posture from the dataset.
%
% :returns: **[posture_index_start, posture_index_end]** - the current posture's start and end index
% :param str mannequin: the choice of mannequin (either ``Fiona`` or ``Martin``)
% :param str posture: the name of the posture 
 
    data_deterministic = load('SingleLayerDeterministic.mat');
    if strcmp(mannequin,'Fiona')
        posture_index_deterministic = find(strcmp(data_deterministic.SingleLayerFiona_Exact, posture));
    else
        posture_index_deterministic = find(strcmp(data_deterministic.SingleLayerMartin_Exact, posture));
    end
    posture_index_end = posture_index_deterministic*1000;
    posture_index_start = posture_index_end - 999;
end

