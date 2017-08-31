function colorCoherenceVector = myFunctionCCV(I, tau, colors, conn)
%MYFUNCTIONCCV Summary of this function goes here
%   Detailed explanation goes here
    I = double(I);
    h = fspecial('average');
    I = imfilter(I, h);
    X = myFunctionDiscretizeCS(I, colors);
    colorCoherenceVector = zeros(2, colors);
    for i = 1:colors
        partialImage = (X==i-1);
        connComp = bwconncomp(partialImage, conn);
        numPixels = cellfun(@numel,connComp.PixelIdxList);
        alpha = 0;
        beta = 0;
        for j = 1:size(numPixels, 2)
            if (numPixels(1,j) >= tau * numel(X))
                alpha = alpha + numPixels(1,j);
            else
                beta = beta + numPixels(1,j);
            end
        end
        colorCoherenceVector(1,i) = alpha;
        colorCoherenceVector(2,i) = beta;
    end
end