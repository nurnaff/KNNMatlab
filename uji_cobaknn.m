clc;clear;close all;
 
image_folder = 'training';
filenames = dir(fullfile(image_folder, '*.jpg'));
total_images = numel(filenames);
 
for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);
    our_images = rgb2gray(imread(full_name));
    glcm=graycomatrix(our_images,'Offset',[2 0]);
    stats = graycoprops(glcm,{'Contrast','Energy'});
    inten(n)=mean(mean(our_images));
    kontras(n)=stats.Contrast;
    energi(n)=stats.Energy;
    entropi(n)=entropy(entropy(our_images));
    training = [inten;kontras;energi;entropi]';
end
 group = cell(20,1);
    group(1:10,:) = {'matang'};
    group(11:20,:) = {'mentah'};
    
image_folder_uji = 'testing';
filenames_uji = dir(fullfile(image_folder_uji, '*.jpg'));
total_images_uji = numel(filenames_uji);
for n = 1:total_images_uji
    full_name_uji = fullfile(image_folder_uji, filenames_uji(n).name);
    our_images_uji = rgb2gray(imread(full_name_uji));
    glcm=graycomatrix(our_images_uji,'Offset',[2 0]);
    stats = graycoprops(glcm,{'Contrast','Energy'});
    inten(n)=mean(mean(our_images_uji));
    kontras(n)=stats.Contrast;
    energi(n)=stats.Energy;
    entropi(n)=entropy(our_images_uji);
    sample = [inten;kontras;energi;entropi]';
end
 
c = fitcknn(training, group,'NumNeighbors',1,'Standardize',1);
Class = predict(c,sample);