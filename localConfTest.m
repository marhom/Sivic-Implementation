function localConfTest(windowsize, thresh, features, img, minFeatures)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
imshow(img);
hold on;
plot(features(1,:), features(2,:), 'gx');
imwrite(img, 'sift.jpg', 'jpeg');
for x=1:size(img,1)-windowsize
    for y=1:size(img,2)-windowsize
        windowCount = 0;
        mismatchCount = 0;
        for n=1:size(features,2)
            if (features(1,n) >= x && features(1,n) <=x+windowsize && features(2,n) >= y && features(2,n) <= y+windowsize)
                windowCount = windowCount + 1;
                if(features(5,n) > .65)
                    mismatchCount = mismatchCount+1;
                end
 
                
                
            end
        end
        
    if(mismatchCount / windowCount > thresh && windowCount > minFeatures)
        patch([x,x+windowsize,x,x+windowsize],[y,y,y+windowsize,y+windowsize],'r','FaceAlpha',.3, 'EdgeAlpha',0)
    end
    end
end

end

