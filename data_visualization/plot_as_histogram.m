function [ current_histogram, mean ] = plot_as_histogram( all_anchors_current_posture, nbins )
% This function visualizes the data as a histogram.
%
% :returns: **[current_histogram, mean]** - the plot of the current histogram and the mean of `all_anchors_current_posture`
% :param all_anchors_current_posture: the array of impedances of the current posture of the data set
% :param int nbins: the number of bins that the histogram plot should have
    current_histogram = histogram(all_anchors_current_posture,nbins);
    hold on;
    mean_data_current_posture = mean2(all_anchors_current_posture);
    mean = num2str(mean_data_current_posture);
end