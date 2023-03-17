function pyramid_aug(I, folder, mode, net)
% I: image name
% folder: output folder
% note that the directory should be set to test (predict) or raw (train) 
% if train mode, set net = []

image = imread(I);

mode = string(mode);

switch mode
    
    case "train"

        [h,w,d] = size(image);
        
        if d==4

            image = image(:,:,1:3);

        end

    case "predict"

        [h,w,~] = size(image);

end

image = imresize(image, [4096, 4096], "method", "nearest");

image = impyramid( image, "reduce");   % 2048

image = impyramid( image, "reduce");   % 1024

image = impyramid( image, "reduce");   % 512

switch mode

    case "predict"

        pred_mask = semanticseg(image, net, "MiniBatchSize",1,"ExecutionEnvironment","gpu","OutputType","uint8")-1;

        pred_mask = medfilter2(imresize(pred_mask, [h,w], "nearest"),[5,5]);

        out_name = fullfile(folder, [I(1:end-4) '.png']);

        imwrite(pred_mask, out_name);

    case "train"

        image1 = rot90(image);

        image2 = rot90(image,2);

        image3 = rot90(image,3);

        image4 = flipud(image);

        image5 = fliplr(image);

        image6 = flipud(image1);

        image7 = imadjust(image2,[0.2, 0.8], []);

        image8 = imsharpen(image);

        image9 = imnoise(image, "gaussian");

        image10 = imnoise(image8, "gaussian");

        augimages = {image, image1, image2, image3, image4, image5, image6, image7, image8, image9, image10};

        for i = 1:length(augimages)

            filename = sprintf([ I(1:end-4) '_%02d.png'], i);

            out_name = fullfile(folder, filename);

            imwrite(augimages{i}, out_name);

        end

end


