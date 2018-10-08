%%%%%%%%%%%%���ݴ���   ��25��P֡��PU���͵�ֱ��ͼ��8*8Ϊ��λ��Ϊ������25ά��
Double_folder = 'C:\Users\45452\OneDrive - bjtu.edu.cn\HEVC\txt_file\Henc_1_ducks_take_off_420_720p50.bin_P_PUNum.txt\';
Single_folder = 'C:\Users\45452\OneDrive - bjtu.edu.cn\HEVC\txt_file\Ori_1_ducks_take_off_420_720p50_.bin_P_PUNum.txt\';

% Double_folder = 'E:\35intra_pred_modes\1080p\P_PUNum\Double8M-10M\';
% Single_folder = 'E:\35intra_pred_modes\1080p\P_PUNum\Single10M\';
 %%%%%%   Double_featire
t1 = dir(Double_folder);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders1 = {t1.name};
mm=0;
for iis=3:length(subfolders1)  
      if subfolders1{iis}==0
           continue
      end
      pathname1 = [Double_folder subfolders1{iis}]; 
      Double_data=importdata(pathname1);
      [m,n]=size(Double_data);
      %����Ϊ8*8Ϊ��λ
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
 t2 = dir(Single_folder);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
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
%%%%%  CIF   ǰ36����single_feature      ����36����double_feature
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
   testNum=randperm(32,5);   %%%%%     30��ѵ����6������   ����36��
    %������Լ������ݼ�  
%   TrainData=zeros(126,25); 
 %   TrainLabel=zeros(126,1);             %ѵ����ǩ
    TrainData=zeros(54,25); %ѵ������
     TrainLabel=zeros(54,1);             %ѵ����ǩ
    %TestData=zeros(32,25);
   %TestLabel=zeros(32,1);
    TestData=zeros(10,25);
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
%model = svmtrain(TrainLabel,TrainData, '-c 1 -g 0.125 -t 0');
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
 
