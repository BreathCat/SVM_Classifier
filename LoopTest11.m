%%%%%%%%%%%%数据处理   求6种模式的五分位+5种I帧内PU类型的五分位为特征（55维）
Double_folder_PU = 'E:\梁晓云\video forensics\35intra_pred_modes\I_PU\Double300K_400K\';
Single_folder_PU = 'E:\梁晓云\video forensics\35intra_pred_modes\I_PU\Singles400K\';

Double_folder_MODE = 'E:\梁晓云\video forensics\35intra_pred_modes\intra_pre_modes\Double300K_400K\';
Single_folder_MODE = 'E:\梁晓云\video forensics\35intra_pred_modes\intra_pre_modes\Singles400K\';
 %%%%%%   Double_featire
t1_PU = dir(Double_folder_PU);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders1_PU = {t1_PU.name};

t1_MODE = dir(Double_folder_MODE);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders1_MODE = {t1_MODE.name};
mm=0;
for iis=3:length(subfolders1_PU)  
      if subfolders1_PU{iis}==0
           continue
      end
      %PU
      pathname1_PU = [Double_folder_PU subfolders1_PU{iis}]; %%%%%    single
      Double_data_PU=importdata(pathname1_PU);
      [m,n]=size(Double_data_PU);

      Double_feature_i_PU=sort(Double_data_PU);
      Double_feature_wei_PU(1,1:5)=Double_feature_i_PU(1,:);%%%%%%  min
      index_left=floor(m/2);%%%%%%%   floor:向下取整
      index_right=ceil(m/2);%%%%%%%   floor:向上取整
      Double_feature_wei_PU(1,6:10)=(Double_feature_i_PU(floor(index_left/2),:)+Double_feature_i_PU(ceil(index_left/2),:))/2;%%%%%%  上四分位
      Double_feature_wei_PU(1,11:15)=(Double_feature_i_PU(index_left,:)+Double_feature_i_PU(index_right,:))/2;%%%%%%中位数
      Double_feature_wei_PU(1,16:20)=(Double_feature_i_PU(index_right+floor((m-index_right+1)/2)-1,:)+Double_feature_i_PU(index_right+ceil((m-index_right+1)/2)-1,:))/2;%%%%%%  下四分位
      Double_feature_wei_PU(1,21:25)=Double_feature_i_PU(m,:);%%%%%%  max
      %MODE
      pathname1_MODE = [Double_folder_MODE subfolders1_MODE{iis}]; %%%%%    single
      Double_data_MODE=importdata(pathname1_MODE);
      [m,n]=size(Double_data_MODE);
      Double_data_ave_MODE=mean(Double_data_MODE,1) %按列平均
    for i=1:m
          Double_feature_i_MODE(i,1)=abs(Double_data_MODE(i,1)-Double_data_ave_MODE(1));
          Double_feature_i_MODE(i,2)=abs(Double_data_MODE(i,2)-Double_data_ave_MODE(2));
          Double_feature_i_MODE(i,3)=abs(Double_data_MODE(i,10)-Double_data_ave_MODE(10));
         Double_feature_i_MODE(i,4)=abs(Double_data_MODE(i,11)-Double_data_ave_MODE(11));
         Double_feature_i_MODE(i,5)=abs(Double_data_MODE(i,26)-Double_data_ave_MODE(26));
         Double_feature_i_MODE(i,6)=abs(Double_data_MODE(i,27)-Double_data_ave_MODE(27));
      end
     Double_feature_i_MODE=sort(Double_feature_i_MODE);
      Double_feature_wei_MODE(1,1:6)=Double_feature_i_MODE(1,:);%%%%%%  min
      index_left=floor(m/2);%%%%%%%   floor:向下取整
      index_right=ceil(m/2);%%%%%%%   floor:向上取整
      Double_feature_wei_MODE(1,7:12)=(Double_feature_i_MODE(floor(index_left/2),:)+Double_feature_i_MODE(ceil(index_left/2),:))/2;%%%%%%  上四分位
      Double_feature_wei_MODE(1,13:18)=(Double_feature_i_MODE(index_left,:)+Double_feature_i_MODE(index_right,:))/2;%%%%%%中位数
      Double_feature_wei_MODE(1,19:24)=(Double_feature_i_MODE(index_right+floor((m-index_right+1)/2)-1,:)+Double_feature_i_MODE(index_right+ceil((m-index_right+1)/2)-1,:))/2;%%%%%%  下四分位
      Double_feature_wei_MODE(1,25:30)=Double_feature_i_MODE(m,:);%%%%%%  max
      
      Double_feature_prob(1,1:25)=Double_feature_wei_PU;
      Double_feature_prob(1,26:55)=Double_feature_wei_MODE;
     
      mm=mm+1;
     Double_feature(mm,:)=Double_feature_prob;
end   

 %%%%%%  Single_featire
t2_PU = dir(Single_folder_PU);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders2_PU = {t2_PU.name};

t2_MODE = dir(Single_folder_MODE);% 先确定子文件夹 返回一个结构数组，包含了文件夹下的子文件夹和子文件的一些信息，第1个成员是文件名，第4个成员表示是否为文件夹。
subfolders2_MODE = {t2_MODE.name};
mm=0;

for iis=3:length(subfolders2_PU)  
      if subfolders2_PU{iis}==0
           continue
      end
      %PU
      pathname2_PU = [Single_folder_PU subfolders2_PU{iis}]; %%%%%    single
      Single_data_PU=importdata(pathname2_PU);
      [m,n]=size(Single_data_PU);

      Single_feature_i_PU=sort(Single_data_PU);
      Single_feature_wei_PU(1,1:5)=Single_feature_i_PU(1,:);%%%%%%  min
      index_left=floor(m/2);%%%%%%%   floor:向下取整
      index_right=ceil(m/2);%%%%%%%   floor:向上取整
      Single_feature_wei_PU(1,6:10)=(Single_feature_i_PU(floor(index_left/2),:)+Single_feature_i_PU(ceil(index_left/2),:))/2;%%%%%%  上四分位
      Single_feature_wei_PU(1,11:15)=(Single_feature_i_PU(index_left,:)+Single_feature_i_PU(index_right,:))/2;%%%%%%中位数
      Single_feature_wei_PU(1,16:20)=(Single_feature_i_PU(index_right+floor((m-index_right+1)/2)-1,:)+Single_feature_i_PU(index_right+ceil((m-index_right+1)/2)-1,:))/2;%%%%%%  下四分位
      Single_feature_wei_PU(1,21:25)=Single_feature_i_PU(m,:);%%%%%%  max
      %MODE
      pathname2_MODE = [Single_folder_MODE subfolders2_MODE{iis}]; %%%%%    single
      Single_data_MODE=importdata(pathname2_MODE);
      [m,n]=size(Single_data_MODE);
      Single_data_ave_MODE=mean(Single_data_MODE,1) %按列平均
    for i=1:m
          Single_feature_i_MODE(i,1)=abs(Single_data_MODE(i,1)-Single_data_ave_MODE(1));
          Single_feature_i_MODE(i,2)=abs(Single_data_MODE(i,2)-Single_data_ave_MODE(2));
          Single_feature_i_MODE(i,3)=abs(Single_data_MODE(i,10)-Single_data_ave_MODE(10));
         Single_feature_i_MODE(i,4)=abs(Single_data_MODE(i,11)-Single_data_ave_MODE(11));
         Single_feature_i_MODE(i,5)=abs(Single_data_MODE(i,26)-Single_data_ave_MODE(26));
         Single_feature_i_MODE(i,6)=abs(Single_data_MODE(i,27)-Single_data_ave_MODE(27));
      end
     Single_feature_i_MODE=sort(Single_feature_i_MODE);
      Single_feature_wei_MODE(1,1:6)=Single_feature_i_MODE(1,:);%%%%%%  min
      index_left=floor(m/2);%%%%%%%   floor:向下取整
      index_right=ceil(m/2);%%%%%%%   floor:向上取整
      Single_feature_wei_MODE(1,7:12)=(Single_feature_i_MODE(floor(index_left/2),:)+Single_feature_i_MODE(ceil(index_left/2),:))/2;%%%%%%  上四分位
      Single_feature_wei_MODE(1,13:18)=(Single_feature_i_MODE(index_left,:)+Single_feature_i_MODE(index_right,:))/2;%%%%%%中位数
      Single_feature_wei_MODE(1,19:24)=(Single_feature_i_MODE(index_right+floor((m-index_right+1)/2)-1,:)+Single_feature_i_MODE(index_right+ceil((m-index_right+1)/2)-1,:))/2;%%%%%%  下四分位
      Single_feature_wei_MODE(1,25:30)=Single_feature_i_MODE(m,:);%%%%%%  max
      
      Single_feature_prob(1,1:25)=Single_feature_wei_PU;
      Single_feature_prob(1,26:55)=Single_feature_wei_MODE;
     
      mm=mm+1;
     Single_feature(mm,:)=Single_feature_prob;
end


%%%%%  CIF   前43个是single_feature      后面43个是double_feature
featuree(1:43,:)=Single_feature;
featuree(44:86,:)=Double_feature;

disp('  featuree finished!!!!');

%转存数据和标签
dataset=featuree;
labelset=LabelSet;   %%%%%%            0--------single        1---------------double
AccuracyRate=zeros(20,1);
%归一化
maxnum=0;
minnum=0;
%for x=1:3
  for x=1:55
    maxnum=max(dataset(:,x));
    minnum=min(dataset(:,x));  
    if maxnum>0
        dataset(:,x)=(dataset(:,x)-minnum)/(maxnum-minnum);
    end 
  end 

for x=1:20
    %  testNum=randperm(79,16); 
   testNum=randperm(43,7);   %%%%%     36个训练，7个测试   ，共43个
    %分离测试集和数据集  
%   TrainData=zeros(126,25); 
 %   TrainLabel=zeros(126,1);             %训练标签
    TrainData=zeros(72,55); %训练数据
     TrainLabel=zeros(72,1);             %训练标签
    %TestData=zeros(32,25);
   %TestLabel=zeros(32,1);
    TestData=zeros(14,55);
      TestLabel=zeros(14,1);
    n=1;
    m=1;
  %   for i=1:79
    for i=1:43
        %判断是否为选定的测试数据
     %   if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) ||i==testNum(6) ||i==testNum(7)||i==testNum(8)||i==testNum(9)||i==testNum(10)||i==testNum(11)||i==testNum(12)||i==testNum(13)||i==testNum(14)||i==testNum(15)||i==testNum(16)
        if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) ||i==testNum(6) ||i==testNum(7)   
            TestData(n,:)=dataset(i,:);
             TestLabel(n)=labelset(i);
          %  TestData(n+16,:)=dataset(i+79,:);
         %   TestLabel(n+16)=labelset(i+79);
             TestData(n+7,:)=dataset(i+43,:);
            TestLabel(n+7)=labelset(i+43);
            n=n+1;
        else
            TrainData(m,:)=dataset(i,:);
            TrainLabel(m)=labelset(i);
         %    TrainData(m+63,:)=dataset(i+79,:);
        %     TrainLabel(m+63)=labelset(i+79);
            TrainData(m+36,:)=dataset(i+43,:);
            TrainLabel(m+36)=labelset(i+43);
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
    for num=1:14
        
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

output=mean(AccuracyRate(:));
disp(output);
 
