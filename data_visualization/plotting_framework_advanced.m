% This script provides to dynamically choose a subset of data and visualize it accordingly. In this context, the following parameters have to be specified before running it:
%
% :param posture_selection: a list consisting of all postures that should be visualized
% :param str mannequin: the choice of mannequin (either ``Fiona`` or ``Martin``)
% :param int nbins: sets the number of bins`
% :param str sigma_underscore_format: the desired choice of standard deviation of the data set. The string should be in the following format: i.e. ``0_1`` to reference 0.1.

clear all`
% addpath('./data_visualization/.');
%% parameters to set
%'poseSitCall_l';'poseSitCall_r';'poseSitDesk';'poseSitHunch';'poseSitI';'poseStandCall_l';'poseStandCall_r';'poseStandFallBackwards_l';'poseStandFallBackwards_r';'poseStandI';'poseStandT';'poseStandWalk_l';'poseStandWalk_r';'poseStandX'}
%posture_selection = {'poseSitCall_l';'poseSitCall_r';'poseSitDesk';'poseSitHunch';'poseSitI';'poseStandCall_l';'poseStandCall_r';'poseStandFallBackwards_l';'poseStandFallBackwards_r';'poseStandI';'poseStandT';'poseStandWalk_l';'poseStandWalk_r';'poseStandX'}
% Goal: to be plot the distribution of a list of selected postures and plot

% %all postures:
posture_selection = {'poseSitCall_l','poseSitCall_r','poseSitDesk','poseSitHunch','poseSitI','poseStandCall_l','poseStandCall_r','poseStandFallBackwards_l','poseStandFallBackwards_r','poseStandI','poseStandT','poseStandWalk_l','poseStandWalk_r','poseStandX'};
% % postures where value of index 1 is around 100:
% posture_selection = {'poseSitCall_l','poseSitCall_r','poseSitDesk','poseSitHunch','poseStandCall_l','poseStandCall_r','poseStandWalk_l','poseStandWalk_r'};
% % postures where value of index 1 is below 90:
% posture_selection = {'poseStandFallBackwards_l','poseStandFallBackwards_r','poseStandT','poseStandX'};
% % postures where value of index 1 is above 120:
% posture_selection = {'poseSitI','poseStandI'};
length(posture_selection)
posture_selection_legend = strrep(posture_selection,'_',' ');
sigma_underscore_format = '0_1';
% sigma_b_with_underscore = '0_01';
% standard_deviation_deterministic = 0.1;
% select which anchor to look at
% Example: 1 -> real part of coil 1, 2 -> imaginary part of coil 1, 3 -> real part of coil 2, ...
selected_anchor = 12;
mannequin = 'Martin';
% mannequin_b = 'Martin';
% mannequin_deterministic = 'Martin';

binWidth = 0.01;
nbins= 4;
%% first dataset
sigma_a_with_dot = strrep(sigma_underscore_format,'_','.');
data_sigma = load(['SingleLayer_AWGN_sigma_',sigma_underscore_format,'.mat']);
posture_selection_legend= strcat(posture_selection_legend);
plot_legend = posture_selection_legend;
means = {};
for i = 1:length(posture_selection)
    current_posture = posture_selection{i};
    [posture_index_start,posture_index_end] = get_posture_dataset_indices(mannequin, current_posture);
    all_anchors_current_posture = create_all_anchors(data_sigma,mannequin,selected_anchor,posture_index_start,posture_index_end);
    %[h_current, means{i}]= plot_histogram_advanced(all_anchors_current_posture,binWidth);
    [h_current, means{i}]= plot_histogram_advanced(all_anchors_current_posture,nbins);

    %posture_selection_legend= strcat(posture_selection_legend,num2str(mean_data_current_posture));
end
%posture_selection_legend = strcat(posture_selection_legend, {', '}, num2str(mean_data_current_posture))
posture_selection_legend = strcat(posture_selection_legend,', with mean: ', means);

lgd = legend(posture_selection_legend);

%h1 = histogram(all_anchors_dataset_a,'BinWidth',binWidth);
hold on;
%% plot_description
sigma_a_with_dot = strrep(sigma_underscore_format,'_','.');

general_info = ['Impedance Distribution of the anchor at index ',num2str(selected_anchor),' using sigma: ',sigma_a_with_dot, ' (', mannequin, ')'];
%description_plot_a = ['sigma: ',sigma_a_with_dot,', has mean: ',num2str(mean_data_sigma_a),' (found empirically based on 1000 samples), ',mannequin_a];
%description_plot_b = ['sigma: ',sigma_b_with_dot,', has mean: ',num2str(mean_data_sigma_b),' (found empirically based on 1000 samples), ',mannequin_b];
%description_plot_c = ['deterministic value ',num2str(anchor_selected_deterministic),' + awgn with sigma = ',num2str(standard_deviation),', has mean: ',num2str(mean_data_deterministic_plus_noise),' (found empirically based on 1000 samples), ',mannequin_deterministic];

title(general_info);
ax = gca;
ax.TitleFontSizeMultiplier = 3;
%lgd = legend(description_plot_a);
lgd.FontSize = 11;

