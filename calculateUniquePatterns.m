function num_patterns = calculateUniquePatterns(colorSeriesVector)
    m = sum(colorSeriesVector);
    num_patterns = factorial(m);
    for count = colorSeriesVector
        num_patterns = num_patterns / factorial(count);
    end
end