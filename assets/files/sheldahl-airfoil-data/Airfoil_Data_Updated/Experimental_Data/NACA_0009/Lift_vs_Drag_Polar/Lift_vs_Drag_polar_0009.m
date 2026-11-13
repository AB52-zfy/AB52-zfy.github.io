clear all;

%% File paths (relative to this script's location)
liftDir = fullfile(fileparts(mfilename('fullpath')), '..', 'Lift Coef vs Alpha');
dragDir = fullfile(fileparts(mfilename('fullpath')), '..', 'Drag Coef vs Alpha');

%% Dataset definitions
% Lift:  Re_360k, Re_500k, Re_690k  |  Drag: Re_360k, Re_500k, Re_700k
% Re_690k (lift) and Re_700k (drag) are treated as paired datasets.
% Drag alpha points differ from lift — drag is interpolated onto lift's alpha grid.

files = {
    'Re_360k_0009.csv', 'Re_360k_0009.csv', 'Re = 0.36\times10^6', 'o', [1 0 0];
    'Re_500k_0009.csv', 'Re_500k_0009.csv', 'Re = 0.50\times10^6', 's', [1 0.5 0];
    'Re_690k_0009.csv', 'Re_700k_0009.csv', 'Re = 0.69/0.70\times10^6', '^', [0.5 0 0.5]
    };
% Columns: lift CSV | drag CSV | legend label | marker | color

%% Save figure setup
figDir = fullfile(fileparts(mfilename('fullpath')), 'figures');
if ~exist(figDir, 'dir'), mkdir(figDir); end

%% Plotting Individually (one polar per Re)
for i = 1:size(files, 1)
    lift_data = readmatrix(fullfile(liftDir, files{i, 1}));
    drag_data = readmatrix(fullfile(dragDir, files{i, 2}));
    label     = files{i, 3};
    marker    = files{i, 4};
    color     = files{i, 5};

    alpha_l = lift_data(:, 1);
    cl      = lift_data(:, 2);
    alpha_d = drag_data(:, 1);
    cd      = drag_data(:, 2);

    % Interpolate drag onto lift's alpha grid (within overlapping range only)
    alpha_min = max(min(alpha_l), min(alpha_d));
    alpha_max = min(max(alpha_l), max(alpha_d));
    valid     = alpha_l >= alpha_min & alpha_l <= alpha_max;
    cd_interp = interp1(alpha_d, cd, alpha_l(valid), 'linear');

    figure;
    set(gcf, 'Color', 'w');
    plot(cd_interp, cl(valid), ...
        'Marker',          marker, ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', color, ...
        'Color',           color, ...
        'LineWidth',       1.2, ...
        'MarkerSize',      10, ...
        'DisplayName',     label);

    xlabel('Coefficient of Drag, c_d',  'FontSize', 15, 'Color', 'k');
    ylabel('Coefficient of Lift, c_l',  'FontSize', 15, 'Color', 'k');
    title(label, 'NACA 0009',            'FontSize', 16, 'Color', 'k');

    xline(0, 'k-', 'HandleVisibility', 'off');
    yline(0, 'k-', 'HandleVisibility', 'off');
    grid on;

    set(gca, 'Color',     'w')
    set(gca, 'GridColor', 'k')
    set(gca, 'GridAlpha', 1)
    set(gca, 'Box',       'on')
    set(gca, 'XColor',    'k')
    set(gca, 'YColor',    'k')

    % Save figure (overwrites existing file)
    re_tag = regexprep(files{i, 1}, '\.csv$', '');
    print(gcf, fullfile(figDir, [re_tag '_polar']), '-dsvg');
end

%% Plotting Altogether (all Re on one figure)
figure;
set(gcf, 'Color', 'w');
hold on;

for i = 1:size(files, 1)
    lift_data = readmatrix(fullfile(liftDir, files{i, 1}));
    drag_data = readmatrix(fullfile(dragDir, files{i, 2}));
    label     = files{i, 3};
    marker    = files{i, 4};
    color     = files{i, 5};

    alpha_l = lift_data(:, 1);
    cl      = lift_data(:, 2);
    alpha_d = drag_data(:, 1);
    cd      = drag_data(:, 2);

    alpha_min = max(min(alpha_l), min(alpha_d));
    alpha_max = min(max(alpha_l), max(alpha_d));
    valid     = alpha_l >= alpha_min & alpha_l <= alpha_max;
    cd_interp = interp1(alpha_d, cd, alpha_l(valid), 'linear');

    plot(cd_interp, cl(valid), ...
        'Marker',          marker, ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', color, ...
        'Color',           color, ...
        'LineWidth',       1.2, ...
        'MarkerSize',      10, ...
        'DisplayName',     label);
end

hold off;

xlabel('Coefficient of Drag, c_d',  'FontSize', 15, 'Color', 'k');
ylabel('Coefficient of Lift, c_l',  'FontSize', 15, 'Color', 'k');
title('NACA-0009 Airfoil Section',   'FontSize', 16, 'Color', 'k');

xline(0, 'k-', 'HandleVisibility', 'off');
yline(0, 'k-', 'HandleVisibility', 'off');
grid on;

set(gca, 'Color',     'w')
set(gca, 'GridColor', 'k')
set(gca, 'GridAlpha', 1)
set(gca, 'Box',       'on')
set(gca, 'XColor',    'k')
set(gca, 'YColor',    'k')
legend('show', 'Location', 'best', 'FontSize', 12, ...
    'TextColor', 'k', 'Color', 'w', 'EdgeColor', 'k');

% Save combined figure (overwrites existing file)
print(gcf, fullfile(figDir, 'Lift_vs_Drag_polar_0009_combined'), '-dsvg');
