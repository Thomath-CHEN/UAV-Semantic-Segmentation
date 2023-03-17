function pyramid_aug_mask(I, folder)
% I: image name
% folder: output folder
% note that the directory should be set to test (predict) or raw (train) 
% if train mode, set net = []

image = imread(I);

image = imresize(image, [512, 512], "method", "nearest");

image1 = rot90(image);

image2 = rot90(image,2);

image3 = rot90(image,3);

image4 = flipud(image);

image5 = fliplr(image);

image6 = flipud(image1);

image7 = image;

image8 = image;

image9 = image;

image10 = image8;

augimages = {image, image1, image2, image3, image4, image5, image6, image7, image8, image9, image10};

for i = 1:length(augimages)

    filename = sprintf([ I(1:end-4) '_%02d.png'], i);

    out_name = fullfile(folder, filename);

    imwrite(augimages{i}, out_name);

end

end