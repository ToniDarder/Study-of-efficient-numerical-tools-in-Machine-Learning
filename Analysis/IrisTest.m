%% Testing with IRIS DATASET
clc;
clear;
close all;
addpath ../Codes;

%% Initialization of hyperparameters
pol_deg         = 1;
testratio       = 30;  
lambda          = 0;
learningRate    = 0.1;
hiddenlayers    = [4,8];

%% INITIALIZATION 
% try different feature combination, pairs of features enable the possibility of plotting boundaries
data      = Data('../Datasets/Iris.csv',30,1);
structure = [data.nFeatures,hiddenlayers,data.nLabels];
network   = Network(data,structure);
optimizer       = Trainer.create(network,'SGD',learningRate);
optimizer.train();
network.plotConfusionMatrix();
if data.nFeatures == 2
    network.plotBoundary('contour');
end

