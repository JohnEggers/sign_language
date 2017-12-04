%% Sign Detector - Team Sign Language
% CS 385
%

%%
% Load positive samples.
% Need to expand and get more positive sets for different types of signs
load('stopSignsAndCars.mat');

%%
% Select the bounding boxes for signs from the table.
% Is taken from the .mat file.
positiveInstances = stopSignsAndCars(:,1:2);

%%
% Add the image directory to the MATLAB path.
% Currently using MatLab's images for testing, but working on adding our
% own.
imDir = fullfile(matlabroot,'toolbox','vision','visiondata',...
    'stopSignImages');
addpath(imDir);

%%
% Specify the folder for negative images.
% Also currently using MatLab's, but we have some of our own being made
% (they don't work quite right yet).
negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata',...
    'nonStopSigns');

%%
% Create an |imageDatastore| object containing negative images.
negativeImages = imageDatastore(negativeFolder);

%%
% Trains a cascade object detector called 'stopSignDetector.xml' using HOG 
% features.
% Takes a VERY long time for larger sets
trainCascadeObjectDetector('stopSignDetector.xml',positiveInstances, ...
    negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',5);

%%
% Use the newly trained classifier to detect signs in an image.
% We'll use this detector with each image to check to make sure that 
detector = vision.CascadeObjectDetector('stopSignDetector.xml');

%%
% Read through the test images.
% Should create a file to read through here, rather than having to specify
% individual images.
img = imread('stopSignTest.jpg');
img2 = imread('stop1.jpg');
img3 = imread('stop2.jpg');
img4 = imread('stop3.png');
img5 = imread('stop4.jpg');
img6 = imread('signs1.jpg');
img7 = imread('signs2.jpg');
img8 = imread('signs3.jpg');
%img9 = imread('signs4.jpg');
img10 = imread('signs5.jpg');
img11 = imread('signs6.jpg');
img12 = imread('signs7.jpg');
%img13 = imread('signs8.jpg');

%%
% Detect the signs in the image. 
% As with the reading of the test images, this needs to be automated so we
% don't have to manually enter everything in.
bbox = step(detector,img); 
bbox2 = step(detector,img2); 
bbox3 = step(detector,img3); 
bbox4 = step(detector,img4); 
bbox5 = step(detector,img5); 
bbox6 = step(detector,img6); 
bbox7 = step(detector,img7); 
bbox8 = step(detector,img8); 
%bbox9 = step(detector,img9);
bbox10 = step(detector,img10);
bbox11 = step(detector,img11);
bbox12 = step(detector,img12);
%bbox13 = step(detector,img13);

%%
% Insert bounding box rectangles and return the marked image.
% Would like to change both color and text depending on the training set.
detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'sign');
detectedImg2 = insertObjectAnnotation(img2,'rectangle',bbox2,'sign');
detectedImg3 = insertObjectAnnotation(img3,'rectangle',bbox3,'sign');
detectedImg4 = insertObjectAnnotation(img4,'rectangle',bbox4,'sign');
detectedImg5 = insertObjectAnnotation(img5,'rectangle',bbox5,'sign');
detectedImg6 = insertObjectAnnotation(img6,'rectangle',bbox6,'sign');
detectedImg7 = insertObjectAnnotation(img7,'rectangle',bbox7,'sign');
detectedImg8 = insertObjectAnnotation(img8,'rectangle',bbox8,'sign');
%detectedImg9 = insertObjectAnnotation(img9,'rectangle',bbox9,'sign');
detectedImg10 = insertObjectAnnotation(img10,'rectangle',bbox10,'sign');
detectedImg11 = insertObjectAnnotation(img11,'rectangle',bbox11,'sign');
detectedImg12 = insertObjectAnnotation(img12,'rectangle',bbox12,'sign');
%detectedImg13 = insertObjectAnnotation(img13,'rectangle',bbox13,'sign');
 
%%
% Display the detected stop sign.
figure; imshow(detectedImg);
figure; imshow(detectedImg2);
figure; imshow(detectedImg3);
figure; imshow(detectedImg4);
figure; imshow(detectedImg5);
figure; imshow(detectedImg6);
figure; imshow(detectedImg7);
figure; imshow(detectedImg8);
%figure; imshow(detectedImg9);
figure; imshow(detectedImg10);
figure; imshow(detectedImg11);
figure; imshow(detectedImg12);
%figure; imshow(detectedImg13);

%%
% Remove the image directory from the path.
rmpath(imDir); 
