%% for training
mkdir("D:\FDLData_new\pyramid_image")
mkdir("D:\FDLData_new\pyramid_label")

image_dir = struct2cell(dir("D:\FDLData_new\raw"))';
image_dir = image_dir(3:end,1:2);
path = image_dir{1,2};
cd(path)

parfor i = 1:length(image_dir)

    pyramid_aug(image_dir{i,1}, "D:\FDLData_new\pyramid_image", "train", []);

end

mask_dir = struct2cell(dir("D:\FDLData_new\Masks"))';
mask_dir = mask_dir(3:end,1:2);
path = mask_dir{1,2};
cd(path)

parfor i = 1:length(mask_dir)

    pyramid_aug_mask(mask_dir{i,1}, "D:\FDLData_new\pyramid_label");

end

%%  for predicting
if exist("D:\FDLData_new\PRED")==0
    mkdir("D:\FDLData_new\PRED")
end

image_dir = struct2cell(dir("D:\FDLData_new\test"))';
image_dir = image_dir(3:end,1:2);
path = image_dir{1,2};
cd(path)

for i = 1:length(image_dir)

    pyramid_aug(image_dir{i,1}, "D:\FDLData_new\PRED", "predict", net);

end

