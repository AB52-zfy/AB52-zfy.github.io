clear all;

%% File paths (relative to this script's location)
liftDir = fullfile(fileparts(mfilename('fullpath')), '..', 'Lift Coef vs Alpha');
dragDir = fullfile(fileparts(mfilename('fullpath')), '..', 'Drag Coef vs Alpha');

%% Dataset definitions
% Lift and Drag share identical Re values (360k, 500k, 680k) — all 3 paired.

lift_files = {
    'Re_360k_0015.csv', 'Re = 0.36\times10^6';
    'Re_500k_0015.csv', 'Re = 0.50\times10^6';
    'Re_680k_0015.csv', 'Re = 0.68\times10^6'
    };

drag_files = {
    'Re_360k_0015.csv', 'Re = 0.36\times10^6';
    'Re_500k_0015.csv', 'Re = 0.50\times10^6';
    'Re_680k_0015.csv', 'Re = 0.68\times10^6'
    };

blue   = [0 0.4470 0.7410];
orange = [0.8500 0.3250 0.0980];

%% Save figure setup
figDir = fullfile(fileparts(mfilename('fullpath')), 'figures');
if ~exist(figDir, 'dir'), mkdir(figDir); end

%% Plotting Individually (one figure per Re — all 3 shared)
for i = 1:size(lift_files, 1)
    lift_data = readmatrix(fullfile(liftDir, lift_files{i, 1}));
    drag_data = readmatrix(fullfile(dragDir, drag_files{i, 1}));
    label     = lift_files{i, 2};

    figure;
    set(gcf, 'Color', 'w');
    hold on;

    plot(lift_data(:, 1), lift_data(:, 2), ...
        'Marker',          'o', ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', blue, ...
        'Color',           blue, ...
        'LineWidth',       1.2, ...
        'MarkerSize',      10, ...
        'DisplayName',     'c_l');

    plot(drag_data(:, 1), drag_data(:, 2), ...
        'Marker',          'o', ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', orange, ...
        'Color',           orange, ...
        'LineWidth',       1.2, ...
        'MarkerSize',      10, ...
        'DisplayName',     'c_d');

    hold off;

    xlabel('Angle of Attack, \alpha (deg)', 'FontSize', 15, 'Color', 'k');
    ylabel('Lift and Drag Coefficients',    'FontSize', 15, 'Color', 'k');
    title(label, 'NACA 0015',               'FontSize', 16, 'Color', 'k');

    xlim([0 180]); xticks(0:10:180);

    yline(0, 'k-', 'HandleVisibility', 'off');
    grid on;

    set(gca, 'Color',     'w')
    set(gca, 'GridColor', 'k')
    set(gca, 'GridAlpha', 1)
    set(gca, 'Box',       'on')
    set(gca, 'XColor',    'k')
    set(gca, 'YColor',    'k')
    legend('show', 'Location', 'northeast', 'FontSize', 12, ...
        'TextColor', 'k', 'Color', 'w', 'EdgeColor', 'k');

    % Save figure (overwrites existing file)
    re_tag = regexprep(lift_files{i, 1}, '\.csv$', '');
    print(gcf, fullfile(figDir, [re_tag '_lift_and_drag']), '-dsvg');
end

%% Plotting Altogether (all Re on one figure)
figure;
set(gcf, 'Color', 'w');
hold on;

lift_files = {
    'Re_360k_0015.csv', 'Re = 0.36\times10^6', [1 0 0];
    'Re_500k_0015.csv', 'Re = 0.50\times10^6', [1 0.5 0];
    'Re_680k_0015.csv', 'Re = 0.68\times10^6', [0.5 0 0.5]
    };

drag_files = {
    'Re_360k_0015.csv', 'Re = 0.36\times10^6', [1 0 0];
    'Re_500k_0015.csv', 'Re = 0.50\times10^6', [1 0.5 0];
    'Re_680k_0015.csv', 'Re = 0.68\times10^6', [0 0 1]
    };

for i = 1:size(lift_files, 1)
    data  = readmatrix(fullfile(liftDir, lift_files{i, 1}));
    color = lift_files{i, 3};
    plot(data(:, 1), data(:, 2), ...
        'Marker',          'o', ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', color, ...
        'Color',           color, ...
        'LineWidth',       1.2, ...
        'MarkerSize',      10, ...
        'DisplayName',     ['c_l, ' lift_files{i, 2}]);
end

for i = 1:size(drag_files, 1)
    data  = readmatrix(fullfile(dragDir, drag_files{i, 1}));
    color = drag_files{i, 3};
    plot(data(:, 1), data(:, 2), ...
        'Marker',          's', ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', color, ...
        'Color',           color, ...
        'LineWidth',       1.2, ...
        'MarkerSize',      10, ...
        'DisplayName',     ['c_d, ' drag_files{i, 2}]);
end

hold off;

xlabel('Angle of Attack, \alpha (deg)', 'FontSize', 15, 'Color', 'k');
ylabel('Lift and Drag Coefficients',    'FontSize', 15, 'Color', 'k');
title('NACA-0015 Airfoil Section',      'FontSize', 16, 'Color', 'k');

xlim([0 180]); xticks(0:10:180);

yline(0, 'k-', 'HandleVisibility', 'off');
grid on;

set(gca, 'Color',     'w')
set(gca, 'GridColor', 'k')
set(gca, 'GridAlpha', 1)
set(gca, 'Box',       'on')
set(gca, 'XColor',    'k')
set(gca, 'YColor',    'k')
legend('show', 'Location', 'northeast', 'FontSize', 12, ...
    'TextColor', 'k', 'Color', 'w', 'EdgeColor', 'k');

% Save combined figure (overwrites existing file)
print(gcf, fullfile(figDir, 'Lift_and_Drag_vs_alpha_0015_combined'), '-dsvg');