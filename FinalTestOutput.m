function FinalTestOutput( features, imageIndex, locs, singleConf, dataDir, expername )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
resDir = [dataDir 'sivic\' expername '\output\'];
imgDir = [dataDir 'raw\reference\'];
mkdir(resDir);
threshold = 15;
oldname = '';
first = true;
for ind=1:size(features,2)
    
    placemark = floor(imageIndex(1,ind)/10);
    view = int32((imageIndex(1,ind)/10 - placemark) * 10);
    
    
    filename = sprintf('%05d_%d.jpg', placemark, view);
    if ~strcmp(filename,oldname) 
        if first == true
            disp('First load:');
            img = imread([imgDir filename]);
            f = figure('visible', 'off'); 
            imshow(img, 'Border', 'tight');
            hold on;
                    
            first = false;
        else
            disp(['saving: ' oldname]);
            saveas(f, [resDir oldname]);
            img = imread([imgDir filename]);
            hold off;
            imshow(img, 'Border', 'tight');
            hold on;
        end
    end
    if singleConf(ind) > threshold
        plot(locs(1, ind), locs(2, ind), 'ro', 'MarkerEdgeColor','k',  'MarkerFaceColor','r');
    else
        plot(locs(1, ind), locs(2, ind), 'go', 'MarkerEdgeColor','k',  'MarkerFaceColor','g');
    end
    oldname = filename;
end
disp(['saving: ' filename]);
saveas(f, [resDir filename]);
end

