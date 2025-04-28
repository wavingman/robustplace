function plotLinearPattern(UIAxes, colorSeriesVector)
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
    
    % Limit the number of patterns to display
    max_patterns = 300; % Adjust this number as needed
    num_patterns = min(num_patterns, max_patterns);
    
    % Define the color map (extend as needed)
    color_map = ['r', 'g', 'b', 'c', 'm', 'y', 'k'];
    
    % Calculate the grid layout
    grid_size = ceil(sqrt(num_patterns));
    
    hold(UIAxes, 'on');
    
    for i = 1:num_patterns
        % Generate a random permutation
        pattern = colors(randperm(m));
        
        % Calculate position for this pattern
        row = ceil(i / grid_size);
        col = mod(i - 1, grid_size) + 1;
        
        % Define the start and end points for this pattern
        start_x = (col - 1) / grid_size;
        end_x = col / grid_size;
        y = 1 - (row - 0.5) / grid_size;
        
        x = linspace(start_x, end_x, m);
        
        for j = 1:m
            color_index = pattern(j);
            color = color_map(color_index);
            plot(UIAxes, x(j), y, 'o', 'MarkerFaceColor', color, 'MarkerEdgeColor', color, 'MarkerSize', 15);
        end
        % Connect the pearls in a straight line
        plot(UIAxes, x, repmat(y, 1, m), 'k-');
        
        % Add pattern number
        text(UIAxes, (start_x + end_x) / 2, y, num2str(i), 'HorizontalAlignment',...
            'center', 'VerticalAlignment', 'bottom','FontSize',14);
    end
    
    axis(UIAxes, 'equal');
    axis(UIAxes, 'off');
    hold(UIAxes, 'off');
    
    % Adjust the layout
    set(UIAxes, 'Visible', 'on');
end
