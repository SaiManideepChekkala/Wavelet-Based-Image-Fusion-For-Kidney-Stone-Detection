%wavelet based Image Fusion

clc;
clear ;
close all;
A = imread('ct.jpg');
B = imread('mri.jpg');

[LL1, LH1, HL1, HH1]=dwt2(A,'haar');
[LL2, LH2, HL2, HH2]=dwt2(B,'haar');

D1=[LL1,LH1;HL1,HH1];
D2=[LL2,LH2;HL2,HH2];

figure;
subplot(1,2,1);
imshow(D1,[]);
title('IMAGE 1');
subplot(1,2,2);
imshow(D2,[]);
title('IMAGE 2');

M1=double(D1);
M2=double(D2);


FusedWaveletCoeff= average(M1,M2);
% sX=size(FusedWaveletCoeff);
[r, ~]=size(FusedWaveletCoeff);
CA = FusedWaveletCoeff(1:(r/2), 1:(r/2));%LLH3
CH = FusedWaveletCoeff(1:(r/2), (r/2 + 1):r);%LHL4
CV = FusedWaveletCoeff((r/2 + 1):r, 1:(r/2));%HLH3
CD = FusedWaveletCoeff((r/2 + 1):r, (r/2 + 1):r);%HHH3
    
RA= idwt2(CA,CH,CV,CD,'haar') ;


figure;
subplot(1,3,1);imshow(A);title('CT');
subplot(1,3,2);imshow(B);title('MRI');
subplot(1,3,3);imshow(RA,[]);title('Fused');

%Kidneystone Detection

clc
close all;
[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
InputImage=imread(strcat(pathname,filename));%read the image
b=rgb2gray(InputImage); %Convert Gray
c=b<20;%Thresholding
figure;imshow(InputImage);
c=imcomplement(c);
figure;imshow(c);
BW5 = imfill(c,'holes');
M = bwareaopen(BW5, 1000);
b=double(b);
figure;imshow(M);
Inew = b.*M;
a=double(InputImage);
Inewc = a.*repmat(M,[1,1,3]);
figure;imshow(Inewc);
PreProcessedImage=uint8(Inewc);
imshow(PreProcessedImage);
PreProcessedImage = imadjust(PreProcessedImage,[0.3 0.7],[]);
Enhancedimage=imadd(PreProcessedImage,50);
Enhancedimage=rgb2gray(Enhancedimage);
FilterImage= medfilt2(Enhancedimage,[5 5]);%process median filter
FilterImage=FilterImage> 250;
se = strel('line',1,5);
FilterImage = imdilate(FilterImage,se);
%Calculating the size of the Image
[r, c, p]=size(FilterImage);
bb=[300 258 200 60];
col=[c/3  c/3  (c/3+40)  (c/3+40)];
row=[(r/2+20) 480 480 (r/2+20)];
BW = roipoly(FilterImage,row,col);       
Inews = FilterImage.*BW;
M = bwareaopen(Inews, 4);
figure;
imshow(M)
[L, num] = bwlabel(Inews,4);
if num >= 1
    disp('Stone Detected');
else
    disp('Stone Not Detected');
end


