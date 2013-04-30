function [ confusingMatches ] = DetermineConfusingFeatures2( matches, GPS, distanceThreshold, imageIndex )
%DETERMINECONFUSINGFEATURES Returns a matrix of # of mismatches
%   Detailed explanation goes here
confusingMatches = [ ];
tic
feat=1:size(matches,2);
queryImgT = floor(imageIndex(feat)/10);
queryImg = repmat(queryImgT,size(matches,1), 1);
nn = 1:size(matches,1);
referenceImg = floor(imageIndex(matches(nn,feat))/10);
pts1 = GPS(queryImg,1:3);
pts2 = GPS(referenceImg,1:3);
dists = sqrt( (pts1(:,1) - pts2(:,1)).^2 + (pts1(:,2) - pts2(:,2)).^2 + (pts1(:,3) - pts2(:,3)).^2);
%dists = haversine( [GPS(queryImg,1) GPS(queryImg,2)], [GPS(referenceImg,1) GPS(referenceImg,2)] );
dists = reshape(dists, size(matches,1), size(matches,2));
confusingMatches = sum( dists > distanceThreshold );
toc 

end