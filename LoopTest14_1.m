%%%%%%%%%%%%���ݴ���   ����6��ģʽ�ĸ���+5��I֡��PU����+25��PU���͵ĸ���Ϊ������36ά��
Double_folder_I_PU = 'E:\������\video forensics\35intra_pred_modes\CIF\I_PU\Double100K_400K\';
Single_folder_I_PU = 'E:\������\video forensics\35intra_pred_modes\CIF\I_PU\Single400K\';

Double_folder_P_PU = 'E:\������\video forensics\35intra_pred_modes\CIF\ALLP_PU\Double100K_400K\';
Single_folder_P_PU = 'E:\������\video forensics\35intra_pred_modes\CIF\ALLP_PU\Single400K\';

Double_folder_MODE = 'E:\������\video forensics\35intra_pred_modes\CIF\intra_pre_modes\Double100K_400K\';
Single_folder_MODE = 'E:\������\video forensics\35intra_pred_modes\CIF\intra_pre_modes\Single400K\';
 %%%%%%   Double_featire
t1_I_PU = dir(Double_folder_I_PU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders1_I_PU = {t1_I_PU.name};

t1_P_PU = dir(Double_folder_P_PU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders1_P_PU = {t1_P_PU.name};

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
      %P_PU
      pathname1_P_PU = [Double_folder_P_PU subfolders1_P_PU{iis}]; %%%%%    single
      Double_data_P_PU=importdata(pathname1_P_PU);
      Double_feature_i_sum_P_PU=sum(Double_data_P_PU);
      SUM_P_PU=sum((sum(Double_data_P_PU))')
      Double_feature_prob_P_PU=Double_feature_i_sum_P_PU/SUM_P_PU;
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
      
      Double_feature_prob(1,1:5)=Double_feature_prob_I_PU;
      Double_feature_prob(1,6:11)=Double_feature_prob_MODE;
      Double_feature_PU_prob(1,1:25)=Double_feature_prob_P_PU;
     mm=mm+1;
     Double_feature(mm,:)=Double_feature_prob;
     Double_feature_PU(mm,:)=Double_feature_PU_prob;
end   

 %%%%%%  Single_featire
t2_I_PU = dir(Single_folder_I_PU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders2_I_PU = {t2_I_PU.name};

t2_P_PU = dir(Single_folder_P_PU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders2_P_PU = {t2_P_PU.name};

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
      %P_PU
      pathname2_P_PU = [Single_folder_P_PU subfolders2_P_PU{iis}]; %%%%%    single
      Single_data_P_PU=importdata(pathname2_P_PU);
      Single_feature_i_sum_P_PU=sum(Single_data_P_PU);
      SUM_P_PU=sum((sum(Single_data_P_PU))')
      Single_feature_prob_P_PU=Single_feature_i_sum_P_PU/SUM_P_PU;
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
      
      Single_feature_prob(1,1:5)=Single_feature_prob_I_PU;
      Single_feature_prob(1,6:11)=Single_feature_prob_MODE;
      Single_feature_PU_prob(1,1:25)=Single_feature_prob_P_PU;
     mm=mm+1;
     Single_feature(mm,:)=Single_feature_prob;
     Single_feature_PU(mm,:)=Single_feature_PU_prob;
end 

%%%%%  CIF   ǰ43����single_feature      ����43����double_feature
featuree(1:43,:)=Single_feature;
featuree(44:86,:)=Double_feature;

featuree_PU(1:43,:)=Single_feature_PU;
featuree_PU(44:86,:)=Double_feature_PU;
disp('  featuree finished!!!!');

%ת�����ݺͱ�ǩ
dataset=featuree;
dataset_PU=featuree_PU;
labelset=LabelSet;   %%%%%%            0--------single        1---------------double
AccuracyRate=zeros(20,1);
%��һ��
maxnum=0;
minnum=0;
%for x=1:3
  for x=1:11
    maxnum=max(dataset(:,x));
    minnum=min(dataset(:,x));  
    if maxnum>0
        dataset(:,x)=(dataset(:,x)-minnum)/(maxnum-minnum);
    end 
  end 
  for x=1:25
    maxnum=max(dataset_PU(:,x));
    minnum=min(dataset_PU(:,x));  
    if maxnum>0
        dataset_PU(:,x)=(dataset_PU(:,x)-minnum)/(maxnum-minnum);
    end 
  end
for x=1:20
    testNum=randperm(43,7);   %%%%%     36��ѵ����7������   ����43��
    %������Լ������ݼ�  
    TrainData=zeros(72,11); %ѵ������
    TrainData_PU=zeros(72,25); %ѵ������
    TrainLabel=zeros(72,1);             %ѵ����ǩ
    TestData=zeros(14,11);
    TestData_PU=zeros(14,25);
    TestLabel=zeros(14,1);
    n=1;
    m=1;
  %   for i=1:79
    for i=1:43
        %�ж��Ƿ�Ϊѡ���Ĳ�������
     %   if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) ||i==testNum(6) ||i==testNum(7)||i==testNum(8)||i==testNum(9)||i==testNum(10)||i==testNum(11)||i==testNum(12)||i==testNum(13)||i==testNum(14)||i==testNum(15)||i==testNum(16)
        if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) ||i==testNum(6) ||i==testNum(7)   
            TestData(n,:)=dataset(i,:);
             TestData_PU(n,:)=dataset_PU(i,:);
             TestLabel(n)=labelset(i);
             TestData(n+7,:)=dataset(i+43,:);
             TestData_PU(n+7,:)=dataset_PU(i+43,:);
            TestLabel(n+7)=labelset(i+43);
            n=n+1;
        else
            TrainData(m,:)=dataset(i,:);
            TrainData_PU(m,:)=dataset_PU(i,:);
            TrainLabel(m)=labelset(i);
            TrainData(m+36,:)=dataset(i+43,:);
            TrainData_PU(m+36,:)=dataset_PU(i+43,:);
            TrainLabel(m+36)=labelset(i+43);
            m=m+1;
        end
    end
    
 %ѵ�������� --------------11ά
 [bestacc,bestc,bestg] = SVMcg(TrainLabel,TrainData,-2,4,-4,4,3,0.5,0.5,0.9);
 cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg),'-t 1'];
model = svmtrain(TrainLabel,TrainData, cmd);
    %���Է���
    [PredictLabel,accuracy,Probability]=svmpredict(TestLabel,TestData,model);
  %%%%%%%%%%%%%%%%%25ά  
 [bestacc,bestc,bestg] = SVMcg(TrainLabel,TrainData_PU,-2,4,-4,4,3,0.5,0.5,0.9);
  cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg),'-t 1'];
model_PU = svmtrain(TrainLabel,TrainData_PU, cmd);
    %���Է���
    [PredictLabel_PU,accuracy_PU,Probability_PU]=svmpredict(TestLabel,TestData_PU,model_PU);  
    
PreLabel=zeros(numel(PredictLabel_PU))
for testNum=1:numel(PredictLabel_PU)   
   if  PredictLabel(testNum) == PredictLabel_PU(testNum)
       PreLabel(testNum)=PredictLabel(testNum);
   else
       if Probability(testNum) > Probability_PU(testNum)
           PreLabel(testNum)=PredictLabel(testNum);
       else
           PreLabel(testNum)=PredictLabel_PU(testNum);
       end
   end   
end
    TN=0;             %%%%%%%%   single---single
    FP=0;               %%%%%%%%   single---double
    TP=0;                %%%%%%%%   DOUBLE---double
    FN=0;                 %%%%%%%%   DOUBLE---SINGLE
    for num=1:14
        
        if TestLabel(num)==0&&PreLabel(num)==0
            TN=TN+1;
        end
         if TestLabel(num)==0&&PreLabel(num)==1
            FP=FP+1;
         end
         if TestLabel(num)==1&&PreLabel(num)==1
            TP=TP+1;
         end
         if TestLabel(num)==1&&PreLabel(num)==0
            FN=FN+1;
        end
    end
    TNR=TN/(TN+FP);    %%%%%%%%��������
    TPR=TP/(TP+FN);     %%%%%%%%��������
    AR=(TPR+TNR)/2;
    AccuracyRate(x)=AR; 
    
end

output=mean(AccuracyRate(:));
disp(output);
 
