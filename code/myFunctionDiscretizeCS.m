function X = myFunctionDiscretizeCS(I, colors)
%X Summary of this function goes here
%   Detailed explanation goes here
    I = double(I);
    channelLevels = floor(nthroot(colors, 3));
    I = floor(I * channelLevels / 256);
    X = zeros(size(I,1), size(I,2));
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            X(i,j) = (channelLevels^2 * I(i, j, 1)) + channelLevels * I(i, j, 2) + I(i, j, 3);
        end
    end
end