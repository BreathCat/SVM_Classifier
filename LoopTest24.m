%%%%%%%%%%%%数据处理   求6种模式的概率+5种I帧PU类型+4种I帧CU类型+4种P帧CU类型+25种P帧PU类型的概率为特征（44维）
I_PU_Double_folder = 'E:\35intra_pred_modes\QCIF\I_PU\del30\Double300K_400K\';
I_PU_Single_folder = 'E:\35intra_pred_modes\QCIF\I_PU\Single400K\';

P_PU_Double_folder = 'E:\35intra_pred_modes\QCIF\P_PU\del30\Double300K_400K\';
P_PU_Single_folder = 'E:\35intra_pred_modes\QCIF\P_PU\Single400K\';

I_CU_Double_folder = 'E:\35intra_pred_modes\QCIF\I_CU\del30\Double300K_400K\';
I_CU_Single_folder = 'E:\35intra_pred_modes\QCIF\I_CU\Single400K\';

P_CU_Double_folder = 'E:\35intra_pred_modes\QCIF\P_CU\del30\Double300K_400K\';
P_CU_Single_folder = 'E:\35intra_pred_modes\QCIF\P_CU\Single400K\';

Double_folder_MODE = 'E:\35intra_pred_modes\QCIF\intra_pre_modes\del30\Double300K_400K\';
Single_folder_MODE = 'E:\35intra_pred_modes\QCIF\intra_pre_modes\Single400K\';
 %%%%%%   Double_featire
P_PU_t1 = dir(P_PU_Double_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
P_PU_subfolders1 = {P_PU_t1.name};

I_PU_t1 = dir(I_PU_Double_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
I_PU_subfolders1 = {I_PU_t1.name};

P_CU_t1 = dir(P_CU_Double_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
P_CU_subfolders1 = {P_CU_t1.name};

I_CU_t1 = dir(I_CU_Double_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
I_CU_subfolders1 = {I_CU_t1.name};

t1_MODE = dir(Double_folder_MODE);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders1_MODE = {t1_MODE.name};
mm=0;
for iis=3:length(P_PU_subfolders1)  
      if P_PU_subfolders1{iis}==0
           continue
      end
      %PU ：I,P
       %%%%%%%%%%%%%%         P_PU
      P_PU_pathname1 = [P_PU_Double_folder P_PU_subfolders1{iis}]; 
      P_PU_Double_data=importdata(P_PU_pathname1);
      [m,n]=size(P_PU_Double_data);
      P_PU_Double_feature_i_sum=sum(P_PU_Double_data);
      P_PU_SUM=sum((sum(P_PU_Double_data))')
      P_PU_Double_feature_prob=P_PU_Double_feature_i_sum/P_PU_SUM;
      %%%%%%%%%%%%%%         I_PU
      I_PU_pathname1 = [I_PU_Double_folder I_PU_subfolders1{iis}]; 
      I_PU_Double_data=importdata(I_PU_pathname1);
      I_PU_Double_feature_i_sum=sum(I_PU_Double_data);
      I_PU_SUM=sum((sum(I_PU_Double_data))')
      I_PU_Double_feature_prob=I_PU_Double_feature_i_sum/I_PU_SUM;
     
      %CU :   I,P
       %%%%%%%%%%%%%%         P_CU
      P_CU_pathname1 = [P_CU_Double_folder P_CU_subfolders1{iis}]; 
      P_CU_Double_data=importdata(P_CU_pathname1);
      [m,n]=size(P_CU_Double_data);
      P_CU_Double_feature_i_sum=sum(P_CU_Double_data);
      P_CU_SUM=sum((sum(P_CU_Double_data))')
      P_CU_Double_feature_prob=P_CU_Double_feature_i_sum/P_CU_SUM;
      %%%%%%%%%%%%%%         I_CU
      I_CU_pathname1 = [I_CU_Double_folder I_CU_subfolders1{iis}]; 
      I_CU_Double_data=importdata(I_CU_pathname1);
      I_CU_Double_feature_i_sum=sum(I_CU_Double_data);
      I_CU_SUM=sum((sum(I_CU_Double_data))')
       I_CU_Double_feature_prob=I_CU_Double_feature_i_sum/I_CU_SUM;
   
      %MODE
      pathname1_MODE = [Double_folder_MODE subfolders1_MODE{iis}]; %%%%%    single
      Double_data_MODE=importdata(pathname1_MODE);
      [m,n]=size(Double_data_MODE);
      Double_data_ave_MODE=mean(Double_data_MODE,1) %按列平均
      for i=1:m
            Double_feature_i_MODE(i,1)=Double_data_MODE(i,1);
          Double_feature_i_MODE(i,2)=Double_data_MODE(i,2);
          Double_feature_i_MODE(i,3)=Double_data_MODE(i,10);
         Double_feature_i_MODE(i,4)=Double_data_MODE(i,11);
         Double_feature_i_MODE(i,5)=Double_data_MODE(i,26);
         Double_feature_i_MODE(i,6)=Double_data_MODE(i,27);
      end
      Double_feature_i_sum_MODE=sum(Double_feature_i_MODE);
      SUM1_MODE=sum((sum(Double_data_MODE))');
      Double_feature_prob_MODE=Double_feature_i_sum_MODE/SUM1_MODE;
      
      Double_feature_prob(1,1:4)=I_CU_Double_feature_prob;
      Double_feature_prob(1,5:9)=I_PU_Double_feature_prob;
      Double_feature_prob(1,10:15)=Double_feature_prob_MODE;
      Double_feature_prob(1,16:19)=P_CU_Double_feature_prob;
      Double_feature_prob(1,20:44)=P_PU_Double_feature_prob;
     mm=mm+1;
     Double_feature(mm,:);
     Double_feature(mm,:)=Double_feature_prob;
end   

 %%%%%%  Single_featire
P_PU_t2 = dir(P_PU_Single_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
P_PU_subfolders2 = {P_PU_t2.name};

I_PU_t2 = dir(I_PU_Single_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
I_PU_subfolders2 = {I_PU_t2.name};

P_CU_t2 = dir(P_CU_Single_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
P_CU_subfolders2 = {P_CU_t2.name};

I_CU_t2 = dir(I_CU_Single_folder);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
I_CU_subfolders2 = {I_CU_t2.name};

t2_MODE = dir(Single_folder_MODE);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders2_MODE = {t2_MODE.name};
mm=0;
for iis=3:length(P_PU_subfolders2)  
      if P_PU_subfolders2{iis}==0
           continue
      end
      %PU:I,P
      %%%%%%%%%%%%%%%           P_PU
      P_PU_pathname2 = [P_PU_Single_folder P_PU_subfolders2{iis}]; %%%%%    single
      P_PU_Single_data=importdata(P_PU_pathname2);
      P_PU_Single_feature_i_sum=sum(P_PU_Single_data);
      P_PU_SUM=sum((sum(P_PU_Single_data))')
      P_PU_Single_feature_prob=P_PU_Single_feature_i_sum/P_PU_SUM;
      %%%%%%%%%%%%%%%          I_PU
      I_PU_pathname2 = [I_PU_Single_folder I_PU_subfolders2{iis}]; %%%%%    single
      I_PU_Single_data=importdata(I_PU_pathname2);
      I_PU_Single_feature_i_sum=sum(I_PU_Single_data);
      I_PU_SUM=sum((sum(I_PU_Single_data))')
      I_PU_Single_feature_prob=I_PU_Single_feature_i_sum/I_PU_SUM;
      
      %CU:I,P
       %%%%%%%%%%%%%%%           P_CU
      P_CU_pathname2 = [P_CU_Single_folder P_CU_subfolders2{iis}]; %%%%%    single
      P_CU_Single_data=importdata(P_CU_pathname2);
      P_CU_Single_feature_i_sum=sum(P_CU_Single_data);
      P_CU_SUM=sum((sum(P_CU_Single_data))')
      P_CU_Single_feature_prob=P_CU_Single_feature_i_sum/P_CU_SUM;
      %%%%%%%%%%%%%%%          I_CU
      I_CU_pathname2 = [I_CU_Single_folder I_CU_subfolders2{iis}]; %%%%%    single
      I_CU_Single_data=importdata(I_CU_pathname2);
      I_CU_Single_feature_i_sum=sum(I_CU_Single_data);
      I_CU_SUM=sum((sum(I_CU_Single_data))')
        I_CU_Single_feature_prob=I_CU_Single_feature_i_sum/I_CU_SUM;
  
      %MODE
      pathname2_MODE = [Single_folder_MODE subfolders2_MODE{iis}]; %%%%%    single
      Single_data_MODE=importdata(pathname2_MODE);
      [m,n]=size(Single_data_MODE);
      Single_data_ave_MODE=mean(Single_data_MODE,1) %按列平均
      for i=1:m
            Single_feature_i_MODE(i,1)=Single_data_MODE(i,1);
          Single_feature_i_MODE(i,2)=Single_data_MODE(i,2);
          Single_feature_i_MODE(i,3)=Single_data_MODE(i,10);
         Single_feature_i_MODE(i,4)=Single_data_MODE(i,11);
         Single_feature_i_MODE(i,5)=Single_data_MODE(i,26);
         Single_feature_i_MODE(i,6)=Single_data_MODE(i,27);
      end
      Single_feature_i_sum_MODE=sum(Single_feature_i_MODE);
      SUM1_MODE=sum((sum(Single_data_MODE))')
      Single_feature_prob_MODE=Single_feature_i_sum_MODE/SUM1_MODE;
      
      Single_feature_prob(1,1:4)=I_CU_Single_feature_prob;
      Single_feature_prob(1,5:9)=I_PU_Single_feature_prob;
      Single_feature_prob(1,10:15)=Single_feature_prob_MODE;
      Single_feature_prob(1,16:19)=P_CU_Single_feature_prob;
      Single_feature_prob(1,20:44)=P_PU_Single_feature_prob;
     mm=mm+1;
     Single_feature(mm,:)=Single_feature_prob;
end 

%%%%%  CIF   前43个是single_feature      后面43个是double_feature
featuree(1:36,:)=Single_feature;
featuree(37:72,:)=Double_feature;

disp('  featuree finished!!!!');

%转存数据和标签
dataset=featuree;
labelset=LabelSet_QCIF;   %%%%%%            0--------single        1---------------double
AccuracyRate=zeros(20,1);
%归一化
maxnum=0;
minnum=0;
%for x=1:3
  for x=1:44
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
   testNum=randperm(36,6);   %%%%%     36个训练，7个测试，共43个; 27个训练，5个测试，共32个；30个训练，6个测试，共36个
    %分离测试集和数据集  
%   TrainData=zeros(126,25); 
 %   TrainLabel=zeros(126,1);             %训练标签
    TrainData=zeros(60,44); %训练数据
     TrainLabel=zeros(60,1);             %训练标签
    %TestData=zeros(32,25);
   %TestLabel=zeros(32,1);
    TestData=zeros(12,44);
      TestLabel=zeros(12,1);
    n=1;
    m=1;
  %   for i=1:79
    for i=1:36
        %判断是否为选定的测试数据
     %   if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) ||i==testNum(6) ||i==testNum(7)||i==testNum(8)||i==testNum(9)||i==testNum(10)||i==testNum(11)||i==testNum(12)||i==testNum(13)||i==testNum(14)||i==testNum(15)||i==testNum(16)
        if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5)   ||i==testNum(6)  
            TestData(n,:)=dataset(i,:);
             TestLabel(n)=labelset(i);
          %  TestData(n+16,:)=dataset(i+79,:);
         %   TestLabel(n+16)=labelset(i+79);
             TestData(n+6,:)=dataset(i+36,:);
            TestLabel(n+6)=labelset(i+36);
            n=n+1;
        else
            TrainData(m,:)=dataset(i,:);
            TrainLabel(m)=labelset(i);
         %    TrainData(m+63,:)=dataset(i+79,:);
        %     TrainLabel(m+63)=labelset(i+79);
            TrainData(m+30,:)=dataset(i+36,:);
            TrainLabel(m+30)=labelset(i+36);
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
    for num=1:12
        
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
 
