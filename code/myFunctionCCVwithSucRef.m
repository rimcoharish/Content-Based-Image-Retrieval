function colorCoherenceVector = myFunctionCCVwithSucRef(I, tau, colors, conn, middlePer)
%MYFUNCTIONCCVWITHSUCREF Summary of this function goes here
%   Detailed explanation goes here
    I = double(I);
    h = fspecial('average');
    I = imfilter(I, h);
    X = myFunctionDiscretizeCS(I, colors);
    colorCoherenceVector = zeros(4, colors);
    for i = 1:colors
        partialImage = (X==i-1);
        connComp = bwconncomp(partialImage, conn);
        alphaMiddle = 0;
        betaMiddle = 0;
        alphaOut = 0;
        betaOut = 0;
        for j = 1:size(connComp.PixelIdxList, 2)
            vec = cell2mat(connComp.PixelIdxList(1, j));
            [iPos, jPos] = ind2sub(size(X), vec);
            meanPos = mean([iPos jPos], 1);
            xlow = size(X, 1) * (1 - middlePer) / 2;
            ylow = size(X, 2) * (1 - middlePer) / 2;
            if (meanPos(1, 1) > xlow)
                if(meanPos(1, 1) < size(X, 1) - xlow)
                    if(meanPos(1, 2) > ylow)
                        if(meanPos(1, 2) < size(X, 2) - ylow)
                            if (size(iPos, 1) > tau * numel(X))
                                alphaMiddle = alphaMiddle + size(iPos, 1);
                            else
                                betaMiddle = betaMiddle + size(iPos, 1);
                            end
                        else
                            if (size(iPos, 1) > tau * numel(X))
                                alphaOut = alphaOut + size(iPos, 1);
                            else
                                betaOut = betaOut + size(iPos, 1);
                            end
                        end
                    else
                        if (size(iPos, 1) > tau * numel(X))
                            alphaOut = alphaOut + size(iPos, 1);
                        else
                            betaOut = betaOut + size(iPos, 1);
                        end
                    end
                else
                    if (size(iPos, 1) > tau * numel(X))
                        alphaOut = alphaOut + size(iPos, 1);
                    else
                        betaOut = betaOut + size(iPos, 1);
                    end
                end
            else
                if (size(iPos, 1) > tau * numel(X))
                    alphaOut = alphaOut + size(iPos, 1);
                else
                    betaOut = betaOut + size(iPos, 1);
                end
            end
        end
        colorCoherenceVector(1,i) = alphaMiddle;
        colorCoherenceVector(2,i) = alphaOut;
        colorCoherenceVector(3,i) = betaMiddle;
        colorCoherenceVector(4,i) = betaOut;
    end
end