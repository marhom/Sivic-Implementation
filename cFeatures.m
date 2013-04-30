function [siftlocs siftdesc] = cFeatures()
%CFEATURES Summary of this function goes here
%   Detailed explanation goes here
siftlocs = [ ];
siftdesc = [ ];
imglist = dir(fullfile('C:\crawler data', '*.jpg'));

%%process sift vectors
for ind = 2:10%length(imglist)
    img = imread(['c:\crawler data\' imglist(2).name]);
    [x y] = ProcessImageSIFT(img, 10,5);
    siftlocs = [siftlocs x];
    siftdesc = [siftdesc y];
end

end

