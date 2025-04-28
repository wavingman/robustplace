function colorSeriesVector = convertInputToVector(Text)
     inputText = Text;
    try
        splitValues = strsplit(strtrim(inputText), ',');
        colorSeriesVector = str2double(splitValues);
        if any(isnan(colorSeriesVector))
            error('Invalid input');
        end
        disp('Color series successfully converted to vector:');
        disp(colorSeriesVector);
    catch
        disp('Error: Invalid input. Please enter numbers separated by commas.');
        colorSeriesVector = [];
    end
end