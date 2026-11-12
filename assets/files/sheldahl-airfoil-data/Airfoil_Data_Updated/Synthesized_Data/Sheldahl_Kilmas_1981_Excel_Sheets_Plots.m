clear all;
% Plotting the Angle of Attack vs Force/Moment Coefficients

%% NACA 0012
% Reading the Excel file 
file = 'Sheldahl_Klimas_1981_converted.xlsx';
data_0012 = readmatrix(file, ...
                  'Sheet','NACA 0012',...
                  'NumHeaderLines',2);

% Defining the variables
alpha = data_0012(:,1); % input variable

Re_vals = {'Re_10k','Re_20k','Re_40k','Re_80k','Re_160k','Re_360k','Re_1M','Re_2M','Re_5M','Re_10M'};
% Looping as per number of Re values used to shorten code
for i = 1:length(Re_vals)
    col = 2*i;
    c_l.(Re_vals{i}) = data_0012(:,col);
    c_d.(Re_vals{i}) = data_0012(:,col+1);
end


% Plotting Lift and Drag vs alpha for all Re values
for i = 1:length(Re_vals)
    cl_data = c_l.(Re_vals{i});
    cd_data = c_d.(Re_vals{i});
    valid_cl = ~isnan(cl_data) & ~isnan(alpha);
    valid_cd = ~isnan(cd_data) & ~isnan(alpha);

    figure('Color','w'); hold on;
    plot(alpha(valid_cl), cl_data(valid_cl), '-o', 'MarkerSize', 7);
    plot(alpha(valid_cd), cd_data(valid_cd), '-*', 'MarkerSize', 7);
    xlabel('Angle of Attack, \alpha (deg)', 'FontSize', 15,'Color','k');
    ylabel('Lift and Drag Coefficients', 'FontSize', 15,'Color','k');
    title(['NACA 0012 | C_L & C_D vs \alpha | ' strrep(Re_vals{i}, '_', ' ')], 'FontSize', 16,'Color','k');
    legend('C_L', 'C_D','FontSize',18,'TextColor','k','Color','w');
    grid on;
    set(gca,'Color','w','XColor','k','YColor','k','GridColor',[0.15 0.15 0.15]);
    hold off;
end    

%% NACA 0015

% Reading the Excel file
data_0015 = readmatrix(file, ...
    'Sheet','NACA 0015',...
    'NumHeaderLines',2);

% Defining the variables for NACA 0015
alpha_0015 = data_0015(:,1); % input variable

Re_vals = {'Re_10k','Re_20k','Re_40k','Re_80k','Re_160k','Re_360k','Re_700k','Re_1M','Re_10M'};
% Looping as per number of Re values used to shorten code
for i = 1:length(Re_vals)
    col = 2*i;
    c_l.(Re_vals{i}) = data_0015(:,col);
    c_d.(Re_vals{i}) = data_0015(:,col+1);
end

% Plotting Lift and Drag vs alpha for all Re values
for i = 1:length(Re_vals)
    cl_data = c_l.(Re_vals{i});
    cd_data = c_d.(Re_vals{i});
    valid_cl = ~isnan(cl_data) & ~isnan(alpha_0015);
    valid_cd = ~isnan(cd_data) & ~isnan(alpha_0015);

    figure('Color','w'); hold on;
    plot(alpha_0015(valid_cl), cl_data(valid_cl), '-o', 'MarkerSize', 7);
    plot(alpha_0015(valid_cd), cd_data(valid_cd), '-*', 'MarkerSize', 7);
    xlabel('Angle of Attack, \alpha (deg)','FontSize',15,'Color','k');
    ylabel('Lift and Drag Coefficients','FontSize',15,'Color','k');
    title(['NACA 0015 | C_L & C_D vs \alpha | ' strrep(Re_vals{i}, '_', ' ')], 'FontSize',16,'Color','k');
    legend('C_L', 'C_D','FontSize',18,'TextColor','k','Color','w');
    grid on;
    set(gca,'Color','w','XColor','k','YColor','k','GridColor',[0.15 0.15 0.15]);
    hold off;
end

%% NACA 0018

% Reading the Excel file
data_0018 = readmatrix(file, ...
    'Sheet','NACA 0018',...
    'NumHeaderLines',2);

% Defining the variables for NACA 0015
alpha_0018 = data_0018(:,1); % input variable

Re_vals = {'Re_10k','Re_20k','Re_40k','Re_80k','Re_160k','Re_360k','Re_700k','Re_1M','Re_2M','Re_5M'};
% Looping as per number of Re values used to shorten code
for i = 1:length(Re_vals)
    col = 2*i;
    c_l.(Re_vals{i}) = data_0018(:,col);
    c_d.(Re_vals{i}) = data_0018(:,col+1);
end

% Plotting Lift and Drag vs alpha for all Re values
for i = 1:length(Re_vals)
    cl_data = c_l.(Re_vals{i});
    cd_data = c_d.(Re_vals{i});
    valid_cl = ~isnan(cl_data) & ~isnan(alpha_0018);
    valid_cd = ~isnan(cd_data) & ~isnan(alpha_0018);

    figure('Color','w'); hold on;
    plot(alpha_0018(valid_cl), cl_data(valid_cl), '-o', 'MarkerSize', 7);
    plot(alpha_0018(valid_cd), cd_data(valid_cd), '-*', 'MarkerSize', 7);
    xlabel('Angle of Attack, \alpha (deg)','FontSize',15,'Color','k');
    ylabel('Lift and Drag Coefficients','FontSize',15,'Color','k');
    title(['NACA 0018 | C_L & C_D vs \alpha | ' strrep(Re_vals{i}, '_', ' ')],'FontSize',16,'Color','k');
    legend('C_L', 'C_D','FontSize',18,'TextColor','k','Color','w');
    grid on;
    set(gca,'Color','w','XColor','k','YColor','k','GridColor',[0.15 0.15 0.15]);
    hold off;
end

%% NACA 0021

% Reading the Excel file
data_0021 = readmatrix(file, ...
    'Sheet','NACA 0021',...
    'NumHeaderLines',2);

% Defining the variables for NACA 0015
alpha_0021 = data_0021(:,1); % input variable

Re_vals = {'Re_10k','Re_20k','Re_80k','Re_160k','Re_360k','Re_700k','Re_1M','Re_2M'};
% Looping as per number of Re values used to shorten code
for i = 1:length(Re_vals)
    col = 2*i;
    c_l.(Re_vals{i}) = data_0021(:,col);
    c_d.(Re_vals{i}) = data_0021(:,col+1);
end

% Plotting Lift and Drag vs alpha for all Re values
for i = 1:length(Re_vals)
    cl_data = c_l.(Re_vals{i});
    cd_data = c_d.(Re_vals{i});
    valid_cl = ~isnan(cl_data) & ~isnan(alpha_0021);
    valid_cd = ~isnan(cd_data) & ~isnan(alpha_0021);

    figure('Color','w'); hold on;
    plot(alpha_0021(valid_cl), cl_data(valid_cl), '-o', 'MarkerSize', 7);
    plot(alpha_0021(valid_cd), cd_data(valid_cd), '-*', 'MarkerSize', 7);
    xlabel('Angle of Attack, \alpha (deg)','FontSize',15,'Color','k');
    ylabel('Lift and Drag Coefficients','FontSize',15,'Color','k');
    title(['NACA 0021 | C_L & C_D vs \alpha | ' strrep(Re_vals{i}, '_', ' ')],'FontSize',16,'Color','k');
    legend('C_L', 'C_D','FontSize',18,'TextColor','k','Color','w');
    grid on;
    set(gca,'Color','w','XColor','k','YColor','k','GridColor',[0.15 0.15 0.15]);
    hold off;
end

%% NACA 0025

% Reading the Excel file
data_0025 = readmatrix(file, ...
    'Sheet','NACA 0025',...
    'NumHeaderLines',2);

% Defining the variables for NACA 0015
alpha_0025 = data_0025(:,1); % input variable

Re_vals = {'Re_20k','Re_40k','Re_80k','Re_160k','Re_360k','Re_700k','Re_1M','Re_2M','Re_5M'};
% Looping as per number of Re values used to shorten code
for i = 1:length(Re_vals)
    col = 2*i;
    c_l.(Re_vals{i}) = data_0025(:,col);
    c_d.(Re_vals{i}) = data_0025(:,col+1);
end

% Plotting Lift and Drag vs alpha for all Re values
for i = 1:length(Re_vals)
    cl_data = c_l.(Re_vals{i});
    cd_data = c_d.(Re_vals{i});
    valid_cl = ~isnan(cl_data) & ~isnan(alpha_0025);
    valid_cd = ~isnan(cd_data) & ~isnan(alpha_0025);

    figure('Color','w'); hold on;
    plot(alpha_0025(valid_cl), cl_data(valid_cl), '-o', 'MarkerSize', 7);
    plot(alpha_0025(valid_cd), cd_data(valid_cd), '-*', 'MarkerSize', 7);
    xlabel('Angle of Attack, \alpha (deg)','FontSize',15,'Color','k');
    ylabel('Lift and Drag Coefficients','FontSize',15,'Color','k');
    title(['NACA 0025 | C_L & C_D vs \alpha | ' strrep(Re_vals{i}, '_', ' ')],'FontSize',16,'Color','k');
    legend('C_L', 'C_D','FontSize',18,'TextColor','k','Color','w');
    grid on;
    set(gca,'Color','w','XColor','k','YColor','k','GridColor',[0.15 0.15 0.15]);
    hold off;
end