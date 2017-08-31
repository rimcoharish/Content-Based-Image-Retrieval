function l1 = myFunctionTestCCVwithSucRef(testImagesLocation, databaseImagesLocation, noOfImages, tau, colors, conn, comparision, middlePer)
%MYFUNCTIONTESTCCVWITHSUCREF Summary of this function goes here
%   Detailed explanation goes here
    l1 = zeros(2, noOfImages);
    ccv = zeros(4, colors, noOfImages);
    parfor i = 1:noOfImages
        I2 = imread(strcat(databaseImagesLocation, num2str(i), '.png'));
        ccv(:,:,i) = myFunctionCCVwithSucRef(I2, tau, colors, conn, middlePer);
    end
    for i = 1:noOfImages
        I1 = imread(strcat(testImagesLocation, num2str(i), '.png'));
        ccv1 = myFunctionCCVwithSucRef(I1, tau, colors, conn, middlePer);
        img = 1;
        error = 0;
        for j = 1:noOfImages
            ccv2 = ccv(:,:,j);
            if (j == 1)
                if (comparision == 1)
                    error = histCompare(ccv1, ccv2);
                else
                    error = ccvCompare(ccv1, ccv2);
                end
            else
                if (comparision == 1)
                    err = histCompare(ccv1, ccv2);
                else
                    err = ccvCompare(ccv1, ccv2);
                end
                if (err < error)
                    error = err;
                    img = j;
                end
            end
        end
        l1(1,i) = img;
        l1(2,i) = error;
    end
end

function l1 = histCompare(ccv1, ccv2)
    l1 = sum(abs(sum(ccv1) - sum(ccv2)));
end

function l1 = ccvCompare(ccv1, ccv2)
    l1 = sum(sum(abs(ccv1 - ccv2)));
end