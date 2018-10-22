%%%%%%%%%%%%数据处理   求25种P帧内PU类型的直方图（8*8为单位）为特征（25维）
Double_folder = 'C:\Users\45452\OneDrive - bjtu.edu.cn\HEVC\txt_file\Henc_1_ducks_take_off_420_720p50.bin_P_PUNum.txt\';
Single_folder = 'C:\Users\45452\OneDrive - bjtu.edu.cn\HEVC\txt_file\Ori_1_ducks_take_off_420_720p50_.bin_P_PUNum.txt\';

% Double_folder = 'E:\35intra_pred_modes\1080p\P_PUNum\Double8M-10M\';
% Single_folder = 'E:\35intra_pred_modes\1080p\P_PUNum\Single10M\';
 %%%%%%   Double_featire
t1 = dir(Double_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders1 = {t1.name};
mm=0;
for iis=3:length(subfolders1)  
      if subfolders1{iis}==0
           continue
      end
      pathname1 = [Double_folder subfolders1{iis}]; 
      Double_data=importdata(pathname1);
      [m,n]=size(Double_data);
      %换算为8*8为单位
    Double_data(:,1)=Double_data(:,1)/4;
    Double_data(:,3)=Double_data(:,3)/2;
    Double_data(:,4)=Double_data(:,4)/2;
    Double_data(:,5)=Double_data(:,5)*4;
    Double_data(:,6)=Double_data(:,6)*2;
    Double_data(:,7)=Double_data(:,7)*2;
    Double_data(:,8)=Double_data(:,8)*2;
    Double_data(:,9)=Double_data(:,9)*2;
    Double_data(:,10)=Double_data(:,10)*2;
    Double_data(:,11)=Double_data(:,11)*2;
    Double_data(:,12)=Double_data(:,12)*16;
    Double_data(:,13)=Double_data(:,13)*8;
    Double_data(:,14)=Double_data(:,14)*8;
    Double_data(:,15)=Double_data(:,15)*12;
    Double_data(:,16)=Double_data(:,16)*12;
    Double_data(:,17)=Double_data(:,17)*4;
    Double_data(:,18)=Double_data(:,18)*4;
    Double_data(:,19)=Double_data(:,19)*64;
    Double_data(:,20)=Double_data(:,20)*32;
    Double_data(:,21)=Double_data(:,21)*32;
    Double_data(:,22)=Double_data(:,22)*48;
    Double_data(:,23)=Double_data(:,23)*48;
    Double_data(:,24)=Double_data(:,24)*16;
    Double_data(:,25)=Double_data(:,25)*16;
      Double_feature_i_sum=sum(Double_data);
      SUM=80;
      Double_feature_prob=Double_feature_i_sum/SUM;
     mm=mm+1;
     Double_feature = zeros(1,25);
     Double_feature(mm,:)=Double_feature_prob;
end   
 %%%%%%  Single_featire
 t2 = dir(Single_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders2 = {t2.name};
mm=0;
for iis=3:length(subfolders2)  
      if subfolders2{iis}==0
           continue
      end
      pathname2 = [Single_folder subfolders2{iis}]; %%%%%    single
      Single_data=importdata(pathname2);
      [m,n]=size(Single_data);
      %%%%%%%%%%%%%%%%%
       Single_data(:,1)=Single_data(:,1)/4;
    Single_data(:,3)=Single_data(:,3)/2;
    Single_data(:,4)=Single_data(:,4)/2;
    Single_data(:,5)=Single_data(:,5)*4;
    Single_data(:,6)=Single_data(:,6)*2;
    Single_data(:,7)=Single_data(:,7)*2;
    Single_data(:,8)=Single_data(:,8)*2;
    Single_data(:,9)=Single_data(:,9)*2;
    Single_data(:,10)=Single_data(:,10)*2;
    Single_data(:,11)=Single_data(:,11)*2;
    Single_data(:,12)=Single_data(:,12)*16;
    Single_data(:,13)=Single_data(:,13)*8;
    Single_data(:,14)=Single_data(:,14)*8;
    Single_data(:,15)=Single_data(:,15)*12;
    Single_data(:,16)=Single_data(:,16)*12;
    Single_data(:,17)=Single_data(:,17)*4;
    Single_data(:,18)=Single_data(:,18)*4;
    Single_data(:,19)=Single_data(:,19)*64;
    Single_data(:,20)=Single_data(:,20)*32;
    Single_data(:,21)=Single_data(:,21)*32;
    Single_data(:,22)=Single_data(:,22)*48;
    Single_data(:,23)=Single_data(:,23)*48;
    Single_data(:,24)=Single_data(:,24)*16;
    Single_data(:,25)=Single_data(:,25)*16;
      Single_feature_i_sum=sum(Single_data);
      SUM=80;
      Single_feature_prob=Single_feature_i_sum/SUM;
     mm=mm+1;
     Single_feature=zeros(1,25);
     Single_feature(mm,:)=Single_feature_prob;
end   
%%%%%  CIF   前36个是single_feature      后面36个是double_feature
featuree(1:32,:)=Single_feature;
featuree(33:64,:)=Double_feature;

disp('  featuree finished!!!!');

%转存数据和标签
dataset=featuree;
labelset=LabelSet_1080p;   %%%%%%            0--------single        1---------------double
AccuracyRate=zeros(20,1);
%归一化
maxnum=0;
minnum=0;
for x=1:25
    maxnum=max(dataset(:,x));
    minnum=min(dataset(:,x));  
    if maxnum>0
        dataset(:,x)=(dataset(:,x)-minnum)/(maxnum-minnum);
    end 
end 

output=zeros(5,1)
for p=1:5
for x=1:20
    %  testNum=randperm(79,16); 
   testNum=randperm(32,5);   %%%%%     30个训练，6个测试   ，共36个
    %分离测试集和数据集  
%   TrainData=zeros(126,25); 
 %   TrainLabel=zeros(126,1);             %训练标签
    TrainData=zeros(54,25); %训练数据
     TrainLabel=zeros(54,1);             %训练标签
    %TestData=zeros(32,25);
   %TestLabel=zeros(32,1);
    TestData=zeros(10,25);
      TestLabel=zeros(10,1);
    n=1;
    m=1;
  %   for i=1:79
    for i=1:32
        %判断是否为选定的测试数据
     %   if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) ||i==testNum(6) ||i==testNum(7)||i==testNum(8)||i==testNum(9)||i==testNum(10)||i==testNum(11)||i==testNum(12)||i==testNum(13)||i==testNum(14)||i==testNum(15)||i==testNum(16)
        if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) 
            TestData(n,:)=dataset(i,:);
             TestLabel(n)=labelset(i);
          %  TestData(n+16,:)=dataset(i+79,:);
         %   TestLabel(n+16)=labelset(i+79);
             TestData(n+5,:)=dataset(i+32,:);
            TestLabel(n+5)=labelset(i+32);
            n=n+1;
        else
            TrainData(m,:)=dataset(i,:);
            TrainLabel(m)=labelset(i);
         %    TrainData(m+63,:)=dataset(i+79,:);
        %     TrainLabel(m+63)=labelset(i+79);
            TrainData(m+27,:)=dataset(i+32,:);
            TrainLabel(m+27)=labelset(i+32);
            m=m+1;
        end
    end
    %训练分类器   
  %建立分类器模型
  %model = svmtrain(TrainLabel, TrainData, '-c 1 -g 2 -t 1');    %建立分类器模型
% 
 [bestacc,bestc,bestg] = SVMcg(TrainLabel,TrainData,-2,4,-4,4,3,0.5,0.5,0.9);
% 
cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg),'-t 1'];
model = svmtrain(TrainLabel,TrainData, cmd);
%model = svmtrain(TrainLabel,TrainData, '-c 1 -g 0.125 -t 0');
disp(cmd);
%model = svmtrain(TrainLabel,TrainData,' -c 0.25 -g 11.3137');
    %参数说明
    % Options：可用的选项即表示的涵义如下
    % 　　-s svm类型：SVM设置类型(默认0)    
    % 　　0 -- C-SVC
    % 　　1 --v-SVC
    % 　　2 – 一类SVM
    % 　　3 -- e -SVR
    % 　　4 -- v-SVR
    % 　　-t 核函数类型：核函数设置类型(默认2)   特征数非常多时或样本数<特征维数：线性核；样本数>特征维数：线性核:用线性模型，可以使用liblinear，并且使用-s 2参数    
    % 　　0 – 线性：u'v
    % 　　1 – 多项式：(r*u'v + coef0)^degree
    % 　　2 – RBF函数：exp(-r|u-v|^2)
    % 　　3 –sigmoid：tanh(r*u'v + coef0)
    % 　　-d degree：核函数中的degree设置(针对多项式核函数)(默认3)
    % 　　-g r(gama)：核函数中的gamma函数设置(针对多项式/rbf/sigmoid核函数)(默认1/ k)
    % 　　-r coef0：核函数中的coef0设置(针对多项式/sigmoid核函数)((默认0)
    % 　　-c cost：设置C-SVC，e -SVR和v-SVR的参数(损失函数)(默认1)
    % 　　-n nu：设置v-SVC，一类SVM和v- SVR的参数(默认0.5)
    % 　　-p p：设置e -SVR 中损失函数p的值(默认0.1)
    % 　　-m cachesize：设置cache内存大小，以MB为单位(默认40)
    % 　　-e eps：设置允许的终止判据(默认0.001)
    % 　　-h shrinking：是否使用启发式，0或1(默认1)
    % 　　-wi weight：设置第几类的参数C为weight*C(C-SVC中的C)(默认1)
    % 　　-v n: n-fold交互检验模式，n为fold的个数，必须大于等于2
    % 　　其中-g选项中的k是指输入数据中的属性数。option -v 随机地将数据剖分为n部分并计算交互检验准确度和均方根误差。
    %   以上这些参数设置可以按照SVM的类型和核函数所支持的参数进行任意组合，如果设置的参数在函数或SVM类型中没有也不会
    %   产生影响，程序不会接受该参数；如果应有的参数设置不正确，参数将采用默认值。

    %测试分类
    [PredictLabel,accuracy]=svmpredict(TestLabel,TestData,model);
    TN=0;             %%%%%%%%   single---single
    FP=0;               %%%%%%%%   single---double
    TP=0;                %%%%%%%%   DOUBLE---double
    FN=0;                 %%%%%%%%   DOUBLE---SINGLE
    for num=1:10
        
        if TestLabel(num)==0&&PredictLabel(num)==0
            TN=TN+1;
        end
         if TestLabel(num)==0&&PredictLabel(num)==1
            FP=FP+1;
         end
         if TestLabel(num)==1&&PredictLabel(num)==1
            TP=TP+1;
         end
         if TestLabel(num)==1&&PredictLabel(num)==0
            FN=FN+1;
        end
    end
    TNR=TN/(TN+FP);    %%%%%%%%真阴性率
    TPR=TP/(TP+FN);     %%%%%%%%真阳性率
    AR=(TPR+TNR)/2;
    AccuracyRate(x)=AR; 
    
end

output(p,1)=mean(AccuracyRate(:));
end
disp(output);
 
