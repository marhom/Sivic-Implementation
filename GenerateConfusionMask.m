function [mask] = GenerateConfusionMask(matches, windowsize, thresh, confImages, imgsize, minFeatures)
% Summary of this function goes here
%   Detailed explanation goes here

im = zeroes(imgsize);





































% windowsize: size of each dimension of the window
% thresh: minimum local confusion score required in order for the region to be confusing
% features: 
% minFeatures: minimum number of features 

% imshow(img);
% hold on;
% plot(features(1,:), features(2,:), 'gx');
% imwrite(img, 'sift.jpg', 'jpeg');

%%Slide the window across the entire image
% mask = zeroes(size(img,1),size(img,2));
% for x=1:size(img,1)-windowsize
%     for y=1:size(img,2)-windowsize
%         windowCount = 0;
%         mismatchCount = 0;
%         
%         
%         
%         %%Check if features are inside the window
%         for n=1:size(features,2)
%             %%update this to make it faster
%             if (features(1,n) >= x && features(1,n) <=x+windowsize && features(2,n) >= y && features(2,n) <= y+windowsize)
%                 
%                 windowCount = windowCount + 1;
%                 %%add the number of confusing matches to the 
%                 mismatchCount = features(5,n)+ mismatchCount;
%                 
%  
%                 
%                 
%             end
%         end
%         
%     if(mismatchCount / windowCount > thresh && windowCount > minFeatures)
%         mask(x:x+windowsize, y:y+windowsize) = 1;
%         %%patch([x,x+windowsize,x,x+windowsize],[y,y,y+windowsize,y+windowsize],'r','FaceAlpha',.3, 'EdgeAlpha',0)
%     end
%     end
% end


end

