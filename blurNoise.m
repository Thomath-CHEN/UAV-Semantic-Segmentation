function augImage = blurNoise(image)

r = rand(1);

if r<0.2
    augImage = imnoise(image,"gaussian");
elseif 0.5<r && r<0.8
    augImage = imgaussfilt(image, 0.5);
else
    augImage = image;
end

end