%%%%%%%%%%%%���ݴ���   ��6��ģʽ�����λ+5��I֡��PU���͵����λΪ������55ά��
Double_folder_PU = 'E:\������\video forensics\35intra_pred_modes\I_PU\Double300K_400K\';
Single_folder_PU = 'E:\������\video forensics\35intra_pred_modes\I_PU\Singles400K\';

Double_folder_MODE = 'E:\������\video forensics\35intra_pred_modes\intra_pre_modes\Double300K_400K\';
Single_folder_MODE = 'E:\������\video forensics\35intra_pred_modes\intra_pre_modes\Singles400K\';
 %%%%%%   Double_featire
t1_PU = dir(Double_folder_PU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders1_PU = {t1_PU.name};

t1_MODE = dir(Double_folder_MODE);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
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
      index_left=floor(m/2);%%%%%%%   floor:����ȡ��
      index_right=ceil(m/2);%%%%%%%   floor:����ȡ��
      Double_feature_wei_PU(1,6:10)=(Double_feature_i_PU(floor(index_left/2),:)+Double_feature_i_PU(ceil(index_left/2),:))/2;%%%%%%  ���ķ�λ
      Double_feature_wei_PU(1,11:15)=(Double_feature_i_PU(index_left,:)+Double_feature_i_PU(index_right,:))/2;%%%%%%��λ��
      Double_feature_wei_PU(1,16:20)=(Double_feature_i_PU(index_right+floor((m-index_right+1)/2)-1,:)+Double_feature_i_PU(index_right+ceil((m-index_right+1)/2)-1,:))/2;%%%%%%  ���ķ�λ
      Double_feature_wei_PU(1,21:25)=Double_feature_i_PU(m,:);%%%%%%  max
      %MODE
      pathname1_MODE = [Double_folder_MODE subfolders1_MODE{iis}]; %%%%%    single
      Double_data_MODE=importdata(pathname1_MODE);
      [m,n]=size(Double_data_MODE);
      Double_data_ave_MODE=mean(Double_data_MODE,1) %����ƽ��
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
      index_left=floor(m/2);%%%%%%%   floor:����ȡ��
      index_right=ceil(m/2);%%%%%%%   floor:����ȡ��
      Double_feature_wei_MODE(1,7:12)=(Double_feature_i_MODE(floor(index_left/2),:)+Double_feature_i_MODE(ceil(index_left/2),:))/2;%%%%%%  ���ķ�λ
      Double_feature_wei_MODE(1,13:18)=(Double_feature_i_MODE(index_left,:)+Double_feature_i_MODE(index_right,:))/2;%%%%%%��λ��
      Double_feature_wei_MODE(1,19:24)=(Double_feature_i_MODE(index_right+floor((m-index_right+1)/2)-1,:)+Double_feature_i_MODE(index_right+ceil((m-index_right+1)/2)-1,:))/2;%%%%%%  ���ķ�λ
      Double_feature_wei_MODE(1,25:30)=Double_feature_i_MODE(m,:);%%%%%%  max
      
      Double_feature_prob(1,1:25)=Double_feature_wei_PU;
      Double_feature_prob(1,26:55)=Double_feature_wei_MODE;
     
      mm=mm+1;
     Double_feature(mm,:)=Double_feature_prob;
end   

 %%%%%%  Single_featire
t2_PU = dir(Single_folder_PU);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders2_PU = {t2_PU.name};

t2_MODE = dir(Single_folder_MODE);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
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
      index_left=floor(m/2);%%%%%%%   floor:����ȡ��
      index_right=ceil(m/2);%%%%%%%   floor:����ȡ��
      Single_feature_wei_PU(1,6:10)=(Single_feature_i_PU(floor(index_left/2),:)+Single_feature_i_PU(ceil(index_left/2),:))/2;%%%%%%  ���ķ�λ
      Single_feature_wei_PU(1,11:15)=(Single_feature_i_PU(index_left,:)+Single_feature_i_PU(index_right,:))/2;%%%%%%��λ��
      Single_feature_wei_PU(1,16:20)=(Single_feature_i_PU(index_right+floor((m-index_right+1)/2)-1,:)+Single_feature_i_PU(index_right+ceil((m-index_right+1)/2)-1,:))/2;%%%%%%  ���ķ�λ
      Single_feature_wei_PU(1,21:25)=Single_feature_i_PU(m,:);%%%%%%  max
      %MODE
      pathname2_MODE = [Single_folder_MODE subfolders2_MODE{iis}]; %%%%%    single
      Single_data_MODE=importdata(pathname2_MODE);
      [m,n]=size(Single_data_MODE);
      Single_data_ave_MODE=mean(Single_data_MODE,1) %����ƽ��
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
      index_left=floor(m/2);%%%%%%%   floor:����ȡ��
      index_right=ceil(m/2);%%%%%%%   floor:����ȡ��
      Single_feature_wei_MODE(1,7:12)=(Single_feature_i_MODE(floor(index_left/2),:)+Single_feature_i_MODE(ceil(index_left/2),:))/2;%%%%%%  ���ķ�λ
      Single_feature_wei_MODE(1,13:18)=(Single_feature_i_MODE(index_left,:)+Single_feature_i_MODE(index_right,:))/2;%%%%%%��λ��
      Single_feature_wei_MODE(1,19:24)=(Single_feature_i_MODE(index_right+floor((m-index_right+1)/2)-1,:)+Single_feature_i_MODE(index_right+ceil((m-index_right+1)/2)-1,:))/2;%%%%%%  ���ķ�λ
      Single_feature_wei_MODE(1,25:30)=Single_feature_i_MODE(m,:);%%%%%%  max
      
      Single_feature_prob(1,1:25)=Single_feature_wei_PU;
      Single_feature_prob(1,26:55)=Single_feature_wei_MODE;
     
      mm=mm+1;
     Single_feature(mm,:)=Single_feature_prob;
end


%%%%%  CIF   ǰ43����single_feature      ����43����double_feature
featuree(1:43,:)=Single_feature;
featuree(44:86,:)=Double_feature;

disp('  featuree finished!!!!');

%ת�����ݺͱ�ǩ
dataset=featuree;
labelset=LabelSet;   %%%%%%            0--------single        1---------------double
AccuracyRate=zeros(20,1);
%��һ��
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
   testNum=randperm(43,7);   %%%%%     36��ѵ����7������   ����43��
    %������Լ������ݼ�  
%   TrainData=zeros(126,25); 
 %   TrainLabel=zeros(126,1);             %ѵ����ǩ
    TrainData=zeros(72,55); %ѵ������
     TrainLabel=zeros(72,1);             %ѵ����ǩ
    %TestData=zeros(32,25);
   %TestLabel=zeros(32,1);
    TestData=zeros(14,55);
      TestLabel=zeros(14,1);
    n=1;
    m=1;
  %   for i=1:79
    for i=1:43
        %�ж��Ƿ�Ϊѡ���Ĳ�������
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
    TNR=TN/(TN+FP);    %%%%%%%%��������
    TPR=TP/(TP+FN);     %%%%%%%%��������
    AR=(TPR+TNR)/2;
    AccuracyRate(x)=AR; 
    
end

output=mean(AccuracyRate(:));
disp(output);
 
