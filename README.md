# UAV-Semantic-Segmentation using Deeplabv3+ (backbone Resnet50)
Use Deeplabv3+ (backbone Resnet50) to perform Semantic Segmentation for UAV images.

## Usage
1. Run train_pred_aug.m to perform augmentations to images and masks.
2. Run partitionData.m to split traning set and test set.
3. Run hurrican_harvel.m to train the model and make prediction. Remeber to load Deeplabv3+ network layergraph if you don't have it.
