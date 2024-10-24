C = load("/Users/wengzihui/Desktop/SummerResearch/output/Community.mat");
numCom = C.C.num_coms;
h = HeatMap(flipud(numCom),'DisplayRange',30);
h.Colormap = jet;

communityArray = C.C.S_consensus_array{1, 7}{1, 34};
pos = load("/Users/wengzihui/Desktop/SummerResearch/output/prep/nodespos.mat");


xpos = pos.xpos;
ypos = pos.ypos;
scatter(xpos, ypos, 200, communityArray, 'filled');
colormap('jet'); 
labelFontSize = 15;
yOffset = 0.01;
for i = 1:74
    text(xpos(i), ypos(i) + yOffset, num2str(i), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom', ...
        'FontSize', labelFontSize);
end

%filename ='/Users/wengzihui/Desktop/SummerResearch/output/prep/spm/edspmeeg_sub-01_ses-meg_task-facerecognition_run-01_proc-sss_meg.mat'
%D = load(filename);
%D.channels.label =[1:74];


% D = spm_eeg_convert(filename);
% data = spm2fieldtrip(D);
% data.freq = communityArray
% data.freq.datatype = "freq";
% %%
% cfg = [];
% cfg.layout = 'CTF151.lay';
% cfg.layout = ft_prepare_layout(cfg);
% figure; ft_plot_layout(cfg.layout);
% 
% cfg = [];
% cfg.xlim = [0.3 0.5];
% cfg.zlim = [0 6e-14];
% cfg.layout = 'CTF151.lay';
% cfg.parameter = 'individual'; % the default 'avg' is not present in the data
% figure; ft_topoplotER(cfg,data.freq); colorbar