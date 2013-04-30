clear all
cd('Z:\results');
load('t1dists.mat');
dists = t1dists;
clear t1dists
load('t2dists.mat');
dists = [dists;dists2];
clear dists2
load('t3dists.mat');
dists = [dists; t3dists];
clear t3dists
load('t4dists.mat');
dists = [dists; t4dists];
clear t4dists
load('t5dists.mat');
dists = [dists; t5dists];

