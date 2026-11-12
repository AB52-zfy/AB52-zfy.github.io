clear all;

files = {
    'Re_360k_0012.csv', 'Re = 0.36\times10^6', 'o', [1 0 0];
    'Re_500k_0012.csv', 'Re = 0.50\times10^6', 's', [1 0.5 0];
    'Re_700k_0012.csv', 'Re = 0.70\times10^6', '^', [0.5 0 0.5]
    };

%% Save figure setup
figDir = fullfile(fileparts(mfilename('fullpath')), 'figures');
if ~exist(figDir, 'dir'), mkdir(figDir); end

%% Plotting Individually
for i = 1:size(files, 1)
    data   = readmatrix(files{i, 1});
    label  = files{i, 2};
    marker = files{i, 3};
    color  = files{i, 4};
    alpha  = data(:, 1);
    drag   = data(:, 2);

    figure;
    set(gcf, 'Color', 'w');
    plot(alpha, drag, ...
        'Marker',          marker, ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', color, ...
        'Color',           color, ...
        'LineWidth',       1.2, ...
        'MarkerSize',      10, ...
        'DisplayName',     label);

    xlabel('Angle of Attack, \alpha (deg)', 'FontSize', 15, 'Color', 'k');
    ylabel('Drag Coefficient, c_d',         'FontSize', 15, 'Color', 'k');
    title(files{i, 2}, 'NACA 0012',         'FontSize', 16, 'Color', 'k');

    xlim([-16 20]);   xticks(-16:4:20);
    ylim([0 0.032]);  yticks(0:0.004:0.032);

    xline(0, 'k-', 'HandleVisibility', 'off');
    grid on;

    set(gca, 'Color',     'w')
    set(gca, 'GridColor', 'k')
    set(gca, 'GridAlpha', 1)
    set(gca, 'Box',       'on')
    set(gca, 'XColor',    'k')
    set(gca, 'YColor',    'k')
    legend('show', 'Location', 'northwest', 'FontSize', 12, ...
        'TextColor', 'k', 'Color', 'w', 'EdgeColor', 'k');

    % Save figure (overwrites existing file)
    figName = regexprep(files{i,1}, '\.csv$', '_drag_small');
    print(gcf, fullfile(figDir, figName), '-dsvg');
end

%% Plotting Altogether
figure;
set(gcf, 'Color', 'w');
hold on;

for i = 1:size(files, 1)
    data   = readmatrix(files{i, 1});
    label  = files{i, 2};
    marker = files{i, 3};
    color  = files{i, 4};
    alpha  = data(:, 1);
    drag   = data(:, 2);

    plot(alpha, drag, ...
        'Marker',          marker, ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', color, ...
        'Color',           color, ...
        'LineWidth',       1.2, ...
        'MarkerSize',      10, ...
        'DisplayName',     label);
end

hold off;

xlabel('Angle of Attack, \alpha (deg)', 'FontSize', 15, 'Color', 'k');
ylabel('Drag Coefficient, c_d',         'FontSize', 15, 'Color', 'k');
title('NACA-0012 Airfoil Section',       'FontSize', 16, 'Color', 'k');

xlim([-16 20]);   xticks(-16:4:20);
ylim([0 0.032]);  yticks(0:0.004:0.032);

xline(0, 'k-', 'HandleVisibility', 'off');
grid on;

set(gca, 'Color',     'w')
set(gca, 'GridColor', 'k')
set(gca, 'GridAlpha', 1)
set(gca, 'Box',       'on')
set(gca, 'XColor',    'k')
set(gca, 'YColor',    'k')
legend('show', 'Location', 'northwest', 'FontSize', 12, ...
    'TextColor', 'k', 'Color', 'w', 'EdgeColor', 'k');

% Save combined figure (overwrites existing file)
print(gcf, fullfile(figDir, 'Drag_vs_alpha_0012_combined'), '-dsvg');
