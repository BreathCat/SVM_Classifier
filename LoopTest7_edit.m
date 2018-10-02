%%%%%%%%%%%%数据处理   求3、4、7种P帧的PU划分模式的概率为特征（3维）
Double_folder = 'C:\Users\45452\OneDrive - bjtu.edu.cn\HEVC\attack\libsvm\Henc_P_PUNum\';%Single是Ori，Double是Henc
Single_folder = 'C:\Users\45452\OneDrive - bjtu.edu.cn\HEVC\attack\libsvm\Ori_P-PUNum\';

 %%%%%%   Double_featire
t1 = dir(Double_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders1 = {t1.name};
mm=0;
for iis=3:length(subfolders1)   %因为subfolders1的第一列和第二列是..所以iis从3开始
      if subfolders1{iis}==0
           continue
      end
      pathname1 = [Double_folder subfolders1{iis}]; %%%%%   iis所有遍历的文件
      Double_data=importdata(pathname1);               %第iis个文件
      [m,n]=size(Double_data);
      Double_data_ave=mean(Double_data,1) ;      %第iis个文件每一列平均成一列
%       for i=1:m
%             Double_feature_i(i,1)=Double_data(i,3);
%           Double_feature_i(i,2)=Double_data(i,4);
%           Double_feature_i(i,3)=Double_data(i,7);
%           
%       end
        Double_feature_i=zeros(1,0);
        temp=(sum(Double_data));
        Double_feature_i(1,1)=temp(1,15);%3
        Double_feature_i(1,2)=temp(1,16);%4
        Double_feature_i(1,3)=temp(1,17);%7

        
      SUM1=sum(temp);
      Double_feature_prob= Double_feature_i/SUM1;
     mm=mm+1;
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
      Single_data_ave=mean(Single_data,1); %按列平均
%       for i=1:m
%          Single_feature_i(i,1)=Single_data(i,3);
%          Single_feature_i(i,2)=Single_data(i,4);
%          Single_feature_i(i,3)=Single_data(i,7);
% 
%       end
% 
%       Single_feature_i_sum=sum(Single_feature_i);
%       SUM=sum((sum(Single_data)));
%       Single_feature_prob=Single_feature_i_sum/SUM;
%      mm=mm+1;
%      Single_feature(mm,:)=Single_feature_prob;

        Single_feature_i=zeros(1,0);
        temp=(sum(Single_data));
        Single_feature_i(1,1)=temp(1,15);%3
        Single_feature_i(1,2)=temp(1,16);%4
        Single_feature_i(1,3)=temp(1,17);%7

        
      SUM1=sum(temp);
      Single_feature_prob= Single_feature_i/SUM1;
     mm=mm+1;
     Single_feature(mm,:)=Single_feature_prob;
     
end   


%%%%%  CIF   前35个是single_feature      后面35个是double_feature
featuree(1:35,:)=Single_feature;
featuree(36:70,:)=Double_feature;

disp('  featuree finished!!!!');

%转存数据和标签
dataset=featuree;
labelset=LabelSet_1080p;   %%%%%%            0--------single        1---------------double
AccuracyRate=zeros(20,1);
%归一化
maxnum=0;
minnum=0;
%for x=1:3
  for x=1:3
    maxnum=max(dataset(:,x));
    minnum=min(dataset(:,x));  
    if maxnum>0
        dataset(:,x)=(dataset(:,x)-minnum)/(maxnum-minnum);
    end 
  end 

  output=zeros(5,1);
for p=1:5
for x=1:20
    %  testNum=randperm(79,16); 
   testNum=randperm(35,5);   %%%%%     30个训练，5个测试   ，共35个
    %分离测试集和数据集  

    TrainData=zeros(60,3);      %训练数据
     TrainLabel=zeros(60,1);    %训练标签

     
    TestData=zeros(10,3);       %测试数据
      TestLabel=zeros(10,1);    %测试标签
    n=1;
    m=1;

    for i=1:35
        %判断是否为选定的测试数据
     %   if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) ||i==testNum(6) ||i==testNum(7)||i==testNum(8)||i==testNum(9)||i==testNum(10)||i==testNum(11)||i==testNum(12)||i==testNum(13)||i==testNum(14)||i==testNum(15)||i==testNum(16)
        if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5)  
            TestData(n,:)=dataset(i,:);
             TestLabel(n)=labelset(i);
          %  TestData(n+16,:)=dataset(i+79,:);
         %   TestLabel(n+16)=labelset(i+79);
             TestData(n+5,:)=dataset(i+35,:);%32
            TestLabel(n+5)=labelset(i+35);
            n=n+1;
        else
            TrainData(m,:)=dataset(i,:);
            TrainLabel(m)=labelset(i);
         %    TrainData(m+63,:)=dataset(i+79,:);
        %     TrainLabel(m+63)=labelset(i+79);
            TrainData(m+30,:)=dataset(i+35,:);%32
            TrainLabel(m+30)=labelset(i+35); %减去5个
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
% disp(output);
 plot(output);
