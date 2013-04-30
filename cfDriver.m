function [ features index results dists ] = cfDriver( datadir, expername )

if(exist([datadir '\' expername], 'dir') == 7)
    disp('Experiment data exists! Loading previously-processed data');
    try
        features = load([datadir '\' expername '\concatenation\concat.mat' ] );
    catch ME
        disp(ME.message)
        if(exist([datadir '\' expername], 'dir'))
            rmdir([datadir '\' expername], 's' )
        end
        return
    end
else
    disp('Experiment data does not exist; processing reference dataset');
    try
        [features imageIndex]= ProcessDatabase(datadir, expername);
    catch ME
        disp(ME.message)
        if(exist([datadir '\' expername], 'dir'))
            rmdir([datadir '\' expername], 's' )
        end
        return
    end
end
features = single(features);
disp('Building tree.');
tic
[index params]= BuildTree(features);
toc
disp('Producing local confusion scores and confusion masks.');
disp('Searching the tree with the reference dataset.');
tic
[results dists] = SearchTree(index, features, params);
toc
disp('Determining individual feature confusion scores');
tic
[confusionScores] = DetermineConfusingFeatures(results,gps,distanceThreshold,imageIndex);
toc


end

