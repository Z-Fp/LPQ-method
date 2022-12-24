%1399/08/18
%using LPQ features to detect real and fake fingerprint
%120 sample for training and 400 sample for testing
close all
clear all
clc
%read input images(for train)
imagepath5='train';
filelist5=dir(fullfile(imagepath5,'*.bmp'));
list5={filelist5.name};
for i=1:length(list5)
    img5{i,1}=imresize(imread(fullfile(imagepath5,list5{i})),[96 96]); 
    
end
data_train=[img5];
for i=1:120
    input1=data_train{i,1};
    r=3;
    lpq_input=lpq(input1,r);
    lpq_input_total{i,1}=lpq_input;
end
z=[];
for i=1:120
    z=[z,reshape(lpq_input_total{i,1},256,1)];
end
xdata=double([z]');
%label
for q=1:60
    group{q,1}='real';
end
for q=61:120
    group{q,1}='fake';
end
%svm struct
svmStruct= svmtrain(xdata,group,'kernel_function','rbf','rbf_sigma',37,'showplot',false);
%testing 
%read input images
%input images for testing
imagepath1='test';
filelist1=dir(fullfile(imagepath1,'*.bmp'));
list1={filelist1.name};
for i=1:length(list1)
    img1{i,1}=imresize(imread(fullfile(imagepath1,list1{i})),[96 96]); 
    
end
data_test=[img1];
for i=1:400
%produce distort images
Mask1=(rand(96,96)<0.2);
MissImage1{i,1}=double(img1{i,1}).*double(Mask1);
end
for i=1:400
    input11=MissImage1{i,1};
 r=3;
    lpq_input1=lpq(input11,r);
    lpq_input_tota11{i,1}=lpq_input1;
end
zz=[];
for i=1:400
    zz=[zz,reshape(lpq_input_tota11{i,1},256,1)];
end
sample=[zz]';
%svm test
Test = svmclassify(svmStruct,sample,'showplot',false);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%f-score
for i=1:300
    actual{i,1}=[0];
end
for i=301:400
    actual{i,1}=[1];
end
for i=1:400
    if Test{i,1}=='real'
        predicted{i,1}=[0];
    else
        predicted{i,1}=[1];
    end
end
ACTUAL=(cell2mat(actual));
PREDICTED=(cell2mat(predicted));
result=fscore(ACTUAL,PREDICTED);






