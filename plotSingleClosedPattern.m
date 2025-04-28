function plotClosedPattern(UIAxes, colorSeriesVector)
    % Clear the current axes
    cla(UIAxes);

    % Total number of pearls
    m = sum(colorSeriesVector);
    
    % Generate the color array
    colors = zeros(1, m);
    index = 1;
    for k = 1:length(colorSeriesVector)
        colors(index:index + colorSeriesVector(k) - 1) = k;
        index = index + colorSeriesVector(k);
    end
    
    % Calculate the number of unique patterns using the specified formula
    num_patterns = factorial(m);
    for count = colorSeriesVector
        num_patterns = num_patterns / factorial(count);
    end
    num_patterns = num_patterns / m;
    
    % Generate all unique permutations of the colors
    unique_patterns = unique(perms(colors), 'rows');
    
    % Define the angle positions for the pearls
    theta = linspace(0, 2 * pi, m + 1);
    theta(end) = []; % Remove the last element to avoid overlap
    
    % Define the color map (extend as needed)
    color_map = ['r', 'g', 'b', 'c', 'm', 'y', 'k']; % Extend this map for more colors
    
    % Calculate the number of rows and columns for subplots
    num_rows = ceil(sqrt(num_patterns));
    num_cols = ceil(num_patterns / num_rows);
    
    % Plot each pattern
    for i = 1:num_patterns
        % Create subplot in the specified UIAxes
        subplot(num_rows, num_cols, i, 'Parent', UIAxes);
        hold on;
        x = cos(theta);
        y = sin(theta);
        for j = 1:m
            color_index = pattern(j);
            color = color_map(color_index);
            plot(x(j), y(j), 'o', 'MarkerFaceColor', color, 'MarkerEdgeColor', color, 'MarkerSize', 10);
        end
        % Connect the pearls in a circle
        plot([x x(1)], [y y(1)], 'k-');
        axis equal;
        axis off;
        title(['Pattern ', num2str(i)]);
        hold off;
    end
    
    % Adjust the layout
    set(UIAxes, 'TightInset', [0 0 0 0]);
    set(UIAxes, 'Visible', 'off');
end