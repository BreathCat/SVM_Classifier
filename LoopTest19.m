%%%%%%%%%%%%���ݴ���   ����6��ģʽ�ĸ���+5��I֡��PU����+25��PU���͵ĸ���Ϊ������36ά��
Double_folder_I_PU = 'E:\35intra_pred_modes\1080p\I_PUNum\Double30M-70M\';
Single_folder_I_PU = 'E:\35intra_pred_modes\1080p\I_PUNum\Single70M\';

Double_folder_I_CU = 'E:\35intra_pred_modes\1080p\I_CUNum\Double30M-70M\';
Single_folder_I_CU = 'E:\35intra_pred_modes\1080p\I_CUNum\Single70M\';

Double_folder_MODE = 'E:\35intra_pred_modes\1080p\intra_pre_modes\Double30M-70M\';
Single_folder_MODE = 'E:\35intra_pred_modes\1080p\intra_pre_modes\Single70M\';
 %%%%%%   Double_featire
t1_I_PU = dir(Double_folder_I_PU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders1_I_PU = {t1_I_PU.name};

t1_I_CU = dir(Double_folder_I_CU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders1_I_CU = {t1_I_CU.name};

t1_MODE = dir(Double_folder_MODE);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders1_MODE = {t1_MODE.name};
mm=0;
for iis=3:length(subfolders1_I_PU)  
      if subfolders1_I_PU{iis}==0
           continue
      end
      %I_PU
      pathname1_I_PU = [Double_folder_I_PU subfolders1_I_PU{iis}]; %%%%%    single
      Double_data_I_PU=importdata(pathname1_I_PU);
      Double_feature_i_sum_I_PU=sum(Double_data_I_PU);
      SUM_I_PU=sum((sum(Double_data_I_PU))')
      Double_feature_prob_I_PU=Double_feature_i_sum_I_PU/SUM_I_PU;
      %I_CU
      pathname1_I_CU = [Double_folder_I_CU subfolders1_I_CU{iis}]; %%%%%    single
      Double_data_I_CU=importdata(pathname1_I_CU);
      Double_feature_i_sum_I_CU=sum(Double_data_I_CU);
      SUM_I_CU=sum((sum(Double_data_I_CU))')
      Double_feature_prob_I_CU=Double_feature_i_sum_I_CU/SUM_I_CU;
      %MODE
      pathname1_MODE = [Double_folder_MODE subfolders1_MODE{iis}]; %%%%%    single
      Double_data_MODE=importdata(pathname1_MODE);
      [m,n]=size(Double_data_MODE);
      Double_data_ave_MODE=mean(Double_data_MODE,1) %����ƽ��
      for i=1:m
            Double_feature_i_MODE(i,1)=Double_data_MODE(i,1);
          Double_feature_i_MODE(i,2)=Double_data_MODE(i,2);
          Double_feature_i_MODE(i,3)=Double_data_MODE(i,10);
         Double_feature_i_MODE(i,4)=Double_data_MODE(i,11);
         Double_feature_i_MODE(i,5)=Double_data_MODE(i,26);
         Double_feature_i_MODE(i,6)=Double_data_MODE(i,27);
      end
      Double_feature_i_sum_MODE=sum(Double_feature_i_MODE);
      SUM1_MODE=sum((sum(Double_data_MODE))')
      Double_feature_prob_MODE=Double_feature_i_sum_MODE/SUM1_MODE;
      
      Double_feature_prob(1,1:4)=Double_feature_prob_I_CU;
      Double_feature_prob(1,5:9)=Double_feature_prob_I_PU;
      Double_feature_prob(1,10:15)=Double_feature_prob_MODE;
     mm=mm+1;
     Double_feature(mm,:)=Double_feature_prob;
end   

 %%%%%%  Single_featire
t2_I_PU = dir(Single_folder_I_PU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders2_I_PU = {t2_I_PU.name};

t2_I_CU = dir(Single_folder_I_CU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders2_I_CU = {t2_I_CU.name};

t2_MODE = dir(Single_folder_MODE);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders2_MODE = {t2_MODE.name};
mm=0;
for iis=3:length(subfolders2_I_PU)  
      if subfolders2_I_PU{iis}==0
           continue
      end
      %I_PU
      pathname2_I_PU = [Single_folder_I_PU subfolders2_I_PU{iis}]; %%%%%    single
      Single_data_I_PU=importdata(pathname2_I_PU);
      Single_feature_i_sum_I_PU=sum(Single_data_I_PU);
      SUM_I_PU=sum((sum(Single_data_I_PU))')
      Single_feature_prob_I_PU=Single_feature_i_sum_I_PU/SUM_I_PU;
      %I_CU
      pathname2_I_CU = [Single_folder_I_CU subfolders2_I_CU{iis}]; %%%%%    single
      Single_data_I_CU=importdata(pathname2_I_CU);
      Single_feature_i_sum_I_CU=sum(Single_data_I_CU);
      SUM_I_CU=sum((sum(Single_data_I_CU))')
      Single_feature_prob_I_CU=Single_feature_i_sum_I_CU/SUM_I_CU;
      %MODE
      pathname2_MODE = [Single_folder_MODE subfolders2_MODE{iis}]; %%%%%    single
      Single_data_MODE=importdata(pathname2_MODE);
      [m,n]=size(Single_data_MODE);
      Single_data_ave_MODE=mean(Single_data_MODE,1) %����ƽ��
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
      
      Single_feature_prob(1,1:4)=Single_feature_prob_I_CU;
      Single_feature_prob(1,5:9)=Single_feature_prob_I_PU;
      Single_feature_prob(1,10:15)=Single_feature_prob_MODE;
     mm=mm+1;
     Single_feature(mm,:)=Single_feature_prob;
end 

%%%%%  CIF   ǰ43����single_feature      ����43����double_feature
featuree(1:32,:)=Single_feature;
featuree(33:64,:)=Double_feature;

disp('  featuree finished!!!!');

%ת�����ݺͱ�ǩ
dataset=featuree;
labelset=LabelSet_1080p;   %%%%%%            0--------single        1---------------double
AccuracyRate=zeros(20,1);
%��һ��
maxnum=0;
minnum=0;
%for x=1:3
  for x=1:15
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
   testNum=randperm(32,5);   %%%%%     36��ѵ����7������   ����43��
    %������Լ������ݼ�  
%   TrainData=zeros(126,25); 
 %   TrainLabel=zeros(126,1);             %ѵ����ǩ
    TrainData=zeros(54,15); %ѵ������
     TrainLabel=zeros(54,1);             %ѵ����ǩ
    %TestData=zeros(32,25);
   %TestLabel=zeros(32,1);
    TestData=zeros(10,15);
      TestLabel=zeros(10,1);
    n=1;
    m=1;
  %   for i=1:79
    for i=1:32
        %�ж��Ƿ�Ϊѡ���Ĳ�������
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
    %ѵ��������   
  %����������ģ��
  %model = svmtrain(TrainLabel, TrainData, '-c 1 -g 2 -t 1');    %����������ģ��
% 
 [bestacc,bestc,bestg] = SVMcg(TrainLabel,TrainData,-2,4,-4,4,3,0.5,0.5,0.9);
% 
cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg),'-t 1'];
model = svmtrain(TrainLabel,TrainData, cmd);
disp(cmd);
%model = svmtrain(TrainLabel,TrainData,' -c 0.25 -g 11.3137');
    %����˵��
    % Options�����õ�ѡ���ʾ�ĺ�������
    % ����-s svm���ͣ�SVM��������(Ĭ��0)    
    % ����0 -- C-SVC
    % ����1 --v-SVC
    % ����2 �C һ��SVM
    % ����3 -- e -SVR
    % ����4 -- v-SVR
    % ����-t �˺������ͣ��˺�����������(Ĭ��2)   �������ǳ���ʱ��������<����ά�������Ժˣ�������>����ά�������Ժ�:������ģ�ͣ�����ʹ��liblinear������ʹ��-s 2����    
    % ����0 �C ���ԣ�u'v
    % ����1 �C ����ʽ��(r*u'v + coef0)^degree
    % ����2 �C RBF������exp(-r|u-v|^2)
    % ����3 �Csigmoid��tanh(r*u'v + coef0)
    % ����-d degree���˺����е�degree����(��Զ���ʽ�˺���)(Ĭ��3)
    % ����-g r(gama)���˺����е�gamma��������(��Զ���ʽ/rbf/sigmoid�˺���)(Ĭ��1/ k)
    % ����-r coef0���˺����е�coef0����(��Զ���ʽ/sigmoid�˺���)((Ĭ��0)
    % ����-c cost������C-SVC��e -SVR��v-SVR�Ĳ���(��ʧ����)(Ĭ��1)
    % ����-n nu������v-SVC��һ��SVM��v- SVR�Ĳ���(Ĭ��0.5)
    % ����-p p������e -SVR ����ʧ����p��ֵ(Ĭ��0.1)
    % ����-m cachesize������cache�ڴ��С����MBΪ��λ(Ĭ��40)
    % ����-e eps�������������ֹ�о�(Ĭ��0.001)
    % ����-h shrinking���Ƿ�ʹ������ʽ��0��1(Ĭ��1)
    % ����-wi weight�����õڼ���Ĳ���CΪweight*C(C-SVC�е�C)(Ĭ��1)
    % ����-v n: n-fold��������ģʽ��nΪfold�ĸ�����������ڵ���2
    % ��������-gѡ���е�k��ָ���������е���������option -v ����ؽ������ʷ�Ϊn���ֲ����㽻������׼ȷ�Ⱥ;�������
    %   ������Щ�������ÿ��԰���SVM�����ͺͺ˺�����֧�ֵĲ�������������ϣ�������õĲ����ں�����SVM������û��Ҳ����
    %   ����Ӱ�죬���򲻻���ܸò��������Ӧ�еĲ������ò���ȷ������������Ĭ��ֵ��

    %���Է���
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
    TNR=TN/(TN+FP);    %%%%%%%%��������
    TPR=TP/(TP+FN);     %%%%%%%%��������
    AR=(TPR+TNR)/2;
    AccuracyRate(x)=AR; 
    
end

output(p,1)=mean(AccuracyRate(:));
  end
disp(output);
 
