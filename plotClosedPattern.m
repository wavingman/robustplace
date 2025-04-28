function plotClosedPattern(UIAxes, colorSeriesVector)
    % Clear the current axes
    cla(UIAxes);

    % Total number of pearls
    m = sum(colorSeriesVector);
    
    % Generate the color array
    colors = [];
    for k = 1:length(colorSeriesVector)
        colors = [colors, repmat(k, 1, colorSeriesVector(k))];
    end
    
    % Calculate the number of unique patterns using the specified formula
    num_patterns = factorial(m);
    for count = colorSeriesVector
        num_patterns = num_patterns / factorial(count);
    end
    num_patterns = round(num_patterns / m);
    
    % Limit the number of patterns to display
    max_patterns = 300; % Adjust this number as needed
    num_patterns = min(num_patterns, max_patterns);
    
    % Define the color map (extend as needed)
    color_map = ['r', 'g', 'b', 'c', 'm', 'y', 'k']; % Extend this map for more colors
    
    % Calculate the grid layout
    grid_size = ceil(sqrt(num_patterns));
    
    hold(UIAxes, 'on');
    
    for i = 1:num_patterns
        % Generate a random permutation
        pattern = colors(randperm(m));
        
        % Calculate position for this pattern
        row = ceil(i / grid_size);
        col = mod(i - 1, grid_size) + 1;
        
        % Define the center and radius for this pattern
        center_x = (col - 0.5) / grid_size;
        center_y = 1 - (row - 0.5) / grid_size;
        radius = 0.8 / (2 * grid_size);
        
        % Define the angle positions for the pearls
        theta = linspace(0, 2 * pi, m + 1);
        theta(end) = []; % Remove the last element to avoid overlap
        
        x = center_x + radius * cos(theta);
        y = center_y + radius * sin(theta);
        
        for j = 1:m
            color_index = pattern(j);
            color = color_map(color_index);
            plot(UIAxes, x(j), y(j), 'o', 'MarkerFaceColor', color, 'MarkerEdgeColor', color, 'MarkerSize', 15);
        end
        % Connect the pearls in a circle
        plot(UIAxes, [x x(1)], [y y(1)], 'k-');
        
        % Add pattern number
        text(UIAxes, center_x, center_y, num2str(i), 'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle','FontSize',14);
    end
    
    axis(UIAxes, 'equal');
    axis(UIAxes, 'off');
    hold(UIAxes, 'off');
    
    % Adjust the layout
    set(UIAxes, 'Visible', 'on');
end
