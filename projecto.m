clear all
imgg1 = imread('moedas1.jpg');
imgg2 = imread('moedas2.jpg');
figure;
subplot(1,2,1), subimage(imgg1);
title('Moedas 1');
subplot(1,2,2), subimage(imgg2);
title('Moedas 2');

thr = graythresh(imgg1)*255;
hold on
plot(thr, 0,'r*')
bw = rgb2gray(imgg1);
bw = bw > thr;
bw = medfilt2(bw);
bw = imdilate(bw, strel('disk',5));
figure,imshow(bw)

%contagem de objectos
[lb num] = bwlabel(bw);
hold on
% ---------------------

props = regionprops(bw,'Centroid','Perimeter', 'Area','MajorAxisLength','MinorAxisLength');

% Acc_poligono = zeros(size(imgg1));
% aux          = zeros(size(imgg1));
% figure(11)
% subplot(1,2,1);
% imagesc(imgg1); colormap gray

for i = 1 : num
    viscircles(props(i).Centroid, 2);
    drawnow
end