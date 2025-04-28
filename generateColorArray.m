function colors = generateColorArray(colorSeriesVector)
    m = sum(colorSeriesVector);
    colors = zeros(1, m);
    index = 1;
    for k = 1:length(colorSeriesVector)
        colors(index:index + colorSeriesVector(k) - 1) = k;
        index = index + colorSeriesVector(k);
    end
end