
%%%%%%%%%%%%���ݴ���   ��3��4��7��P֡��PU����ģʽ�ĸ���Ϊ������3ά��
Double_folder = 'C:\Users\45452\OneDrive - bjtu.edu.cn\HEVC\attack\libsvm\P-PUNUM\Henc_P_PUNum\10M\';%Single��Ori��Double��Henc
Single_folder = 'C:\Users\45452\OneDrive - bjtu.edu.cn\HEVC\attack\libsvm\P-PUNUM\Ori_P-PUNum\10M\';
half_num = 30; %Double_folder�ĸ���
half_test_num = 5; %��Double_folder��ѡȡ���Եĸ��� ��������Լ���ѵ����if��Ҫ��i���жϴ�����
Dimension = 25; %ѡȡ��ά�� ����������Double_feature_i��Ҫ�����޸ģ�

 %%%%%%   Double_featire
t1 = dir(Double_folder);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
subfolders1 = {t1.name};
mm=0;
for iis=3:length(subfolders1)   %��Ϊsubfolders1�ĵ�һ�к͵ڶ�����..����iis��3��ʼ
      if subfolders1{iis}==0
           continue
      end
      pathname1 = [Double_folder subfolders1{iis}]; %%%%%   iis���б������ļ�
      Double_data=importdata(pathname1);               %��iis���ļ�
      [m,n]=size(Double_data);
      Double_data_ave=mean(Double_data,1) ;      %��iis���ļ�ÿһ��ƽ����һ�� 1080P��Ϊtxt�ļ����淶�����Գ���ϵ��
%       for i=1:m
%             Double_feature_i(i,1)=Double_data(i,3);
%           Double_feature_i(i,2)=Double_data(i,4);
%           Double_feature_i(i,3)=Double_data(i,7);
%           
%       end
        Double_feature_i=zeros(1,0);
        temp=(sum(Double_data));
        Double_feature_i(1,1)=temp(1,1);%3
        Double_feature_i(1,2)=temp(1,2);%4
        Double_feature_i(1,3)=temp(1,3);%7
        Double_feature_i(1,4)=temp(1,4);
        Double_feature_i(1,5)=temp(1,5);
        Double_feature_i(1,6)=temp(1,6);
        Double_feature_i(1,7)=temp(1,7);
        Double_feature_i(1,8)=temp(1,8);
        Double_feature_i(1,9)=temp(1,9);
        Double_feature_i(1,10)=temp(1,10);
        Double_feature_i(1,11)=temp(1,11);
        Double_feature_i(1,12)=temp(1,12);
        Double_feature_i(1,13)=temp(1,13);
        Double_feature_i(1,14)=temp(1,14);
        Double_feature_i(1,15)=temp(1,15);
        Double_feature_i(1,16)=temp(1,16);
        Double_feature_i(1,17)=temp(1,17);
        Double_feature_i(1,18)=temp(1,18);
        Double_feature_i(1,19)=temp(1,19);
        Double_feature_i(1,20)=temp(1,20);
        Double_feature_i(1,21)=temp(1,21);
        Double_feature_i(1,22)=temp(1,22);
        Double_feature_i(1,23)=temp(1,23);
        Double_feature_i(1,24)=temp(1,24);
        Double_feature_i(1,Dimension)=temp(1,Dimension);
        
      SUM1=sum(temp);
      Double_feature_prob= Double_feature_i/SUM1;
     mm=mm+1;
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
      Single_data_ave=mean(Single_data,1); %����ƽ��
              

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

        Single_feature_i=zeros(1,Dimension);

        temp=(sum(Single_data));
        Single_feature_i(1,1)=temp(1,1);%3
        Single_feature_i(1,2)=temp(1,2);%4
        Single_feature_i(1,3)=temp(1,3);%7
        Single_feature_i(1,4)=temp(1,4);
        Single_feature_i(1,5)=temp(1,5);
        Single_feature_i(1,6)=temp(1,6);
        Single_feature_i(1,7)=temp(1,7);
        Single_feature_i(1,8)=temp(1,8);
        Single_feature_i(1,9)=temp(1,9);
        Single_feature_i(1,10)=temp(1,10);
        Single_feature_i(1,11)=temp(1,11);
        Single_feature_i(1,12)=temp(1,12);
        Single_feature_i(1,13)=temp(1,13);
        Single_feature_i(1,14)=temp(1,14);
        Single_feature_i(1,15)=temp(1,15);
        Single_feature_i(1,16)=temp(1,16);
        Single_feature_i(1,17)=temp(1,17);
        Single_feature_i(1,18)=temp(1,18);
        Single_feature_i(1,19)=temp(1,19);
        Single_feature_i(1,20)=temp(1,20);
        Single_feature_i(1,21)=temp(1,21);
        Single_feature_i(1,22)=temp(1,22);
        Single_feature_i(1,23)=temp(1,23);
        Single_feature_i(1,24)=temp(1,24);
        Single_feature_i(1,Dimension)=temp(1,Dimension);
      SUM1=sum(temp);
      Single_feature_prob= Single_feature_i/SUM1;
     mm=mm+1;
     Single_feature(mm,:)= Single_feature_i/SUM1;
     
end   


%%%%%  CIF   ǰ35����single_feature      ����35����double_feature
featuree(1:half_num,:)=Single_feature;
featuree(half_num+1:2*half_num,:)=Double_feature;

disp('  featuree finished!!!!');

%ת�����ݺͱ�ǩ
dataset=featuree;
labelset(1:half_num,:)=0;  labelset(half_num+1:2*half_num,:)=1;   %%%%%%            0--------single        1---------------double
AccuracyRate=zeros(20,1);
%��һ��
maxnum=0;
minnum=0;
%for x=1:3
%   for x=1:Dimension
%     maxnum=max(dataset(:,x));
%     minnum=min(dataset(:,x));  
%     if maxnum>0
%         dataset(:,x)=(dataset(:,x)-minnum)/(maxnum-minnum);
%     end 
%   end 

%���޲���������ע�� 10.22
% for x=1:32
%     maxnum=max(dataset(x,:));
%     minnum=min(dataset(x,:));  
%     if maxnum>0
%         dataset(x,:)=(dataset(x,:)-minnum)/(maxnum-minnum);
%     end 
% end 


  output=zeros(5,1);
for p=1:5
for x=1:20
    %  testNum=randperm(79,16); 
   testNum=randperm(half_num,half_test_num);   %%%%%     30��ѵ����5������   ����35��
    %������Լ������ݼ�  

    TrainData=zeros(half_num*2-half_test_num*2,Dimension);      %ѵ������
     TrainLabel=zeros(half_num*2-half_test_num*2,1);    %ѵ����ǩ

     
    TestData=zeros(half_test_num*2,Dimension);       %��������
      TestLabel=zeros(half_test_num*2,1);    %���Ա�ǩ
    n=1;
    m=1;

    for i=1:half_num
        %�ж��Ƿ�Ϊѡ���Ĳ�������
     %   if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5) ||i==testNum(6) ||i==testNum(7)||i==testNum(8)||i==testNum(9)||i==testNum(10)||i==testNum(11)||i==testNum(12)||i==testNum(13)||i==testNum(14)||i==testNum(15)||i==testNum(16)
        if i==testNum(1) || i==testNum(2) || i==testNum(3) || i==testNum(4) || i==testNum(5)  
            TestData(n,:)=dataset(i,:);
             TestLabel(n)=labelset(i);
          %  TestData(n+16,:)=dataset(i+79,:);
         %   TestLabel(n+16)=labelset(i+79);
             TestData(n+half_test_num,:)=dataset(i+half_num,:);%32
            TestLabel(n+half_test_num)=labelset(i+half_num);
            n=n+1;
        else
            TrainData(m,:)=dataset(i,:);
            TrainLabel(m)=labelset(i);
         %    TrainData(m+63,:)=dataset(i+79,:);
        %     TrainLabel(m+63)=labelset(i+79);
            TrainData(m+half_num-half_test_num,:)=dataset(i+half_num,:);%32
            TrainLabel(m+half_num-half_test_num)=labelset(i+half_num); %��ȥ5��
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
% disp(output);
 plot(output);
