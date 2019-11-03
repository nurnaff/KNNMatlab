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
    entropi(n)=entropy(our_images);
    training = [inten;kontras;energi;entropi]';
end
xlswrite('fitur.xls',training);