%%%%%%%%%%%%���ݴ���   ������֡��PU���͵ĸ���Ϊ������25ά��
P_PU_Double_folder = 'J:\������\video forensics\35intra_pred_modes\CIF\ALLP_PU\Double300K_400K\';
P_PU_Single_folder = 'J:\������\video forensics\35intra_pred_modes\CIF\ALLP_PU\Single400K\';

I_PU_Double_folder = 'J:\������\video forensics\35intra_pred_modes\CIF\I_PU\Double300K_400K\';
I_PU_Single_folder = 'J:\������\video forensics\35intra_pred_modes\CIF\I_PU\Single400K\';
 %%%%%%   Double_featire
P_PU_t1 = dir(P_PU_Double_folder);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
P_PU_subfolders1 = {P_PU_t1.name};

I_PU_t1 = dir(I_PU_Double_folder);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
I_PU_subfolders1 = {I_PU_t1.name};
mm=0;
for iis=3:length(P_PU_subfolders1)  
      if P_PU_subfolders1{iis}==0
           continue
      end
      %%%%%%%%%%%%%%         P_PU
      P_PU_pathname1 = [P_PU_Double_folder P_PU_subfolders1{iis}]; 
      P_PU_Double_data=importdata(P_PU_pathname1);
      [m,n]=size(P_PU_Double_data);
      P_PU_Double_feature_i_sum=sum(P_PU_Double_data);
      P_PU_SUM=sum((sum(P_PU_Double_data))')
      
      %%%%%%%%%%%%%%         I_PU
      I_PU_pathname1 = [I_PU_Double_folder I_PU_subfolders1{iis}]; 
      I_PU_Double_data=importdata(I_PU_pathname1);
      I_PU_Double_feature_i_sum=sum(I_PU_Double_data);
      I_PU_SUM=sum((sum(I_PU_Double_data))')
      
      for numm = 1:25
          if numm==1 
                PU_Double_feature_i_sum(numm)=P_PU_Double_feature_i_sum(numm)+I_PU_Double_feature_i_sum(1);%%%%%%%%%4*4
            elseif numm==2 
                PU_Double_feature_i_sum(numm)=P_PU_Double_feature_i_sum(numm)+I_PU_Double_feature_i_sum(2);%%%%%%%%%8*8
            elseif numm==5 
                PU_Double_feature_i_sum(numm)=P_PU_Double_feature_i_sum(numm)+I_PU_Double_feature_i_sum(3);%%%%%%%%%16*16
            elseif numm==12 
                PU_Double_feature_i_sum(numm)=P_PU_Double_feature_i_sum(numm)+I_PU_Double_feature_i_sum(4);%%%%%%%%%32*32
          elseif numm==19
                PU_Double_feature_i_sum(numm)=P_PU_Double_feature_i_sum(numm)+I_PU_Double_feature_i_sum(5);%%%%%%%%%64*64
          else 
              PU_Double_feature_i_sum(numm)=P_PU_Double_feature_i_sum(numm);
           end
      end
      
      SUM=P_PU_SUM+I_PU_SUM;
      PU_Double_feature_prob=PU_Double_feature_i_sum/SUM;
      
      Double_feature_prob=PU_Double_feature_prob;
     
     mm=mm+1;
     Double_feature(mm,:)=Double_feature_prob;
end   
 %%%%%%  Single_featire
 P_PU_t2 = dir(P_PU_Single_folder);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
P_PU_subfolders2 = {P_PU_t2.name};

I_PU_t2 = dir(I_PU_Single_folder);% ��ȷ�����ļ��� ����һ���ṹ���飬�������ļ����µ����ļ��к����ļ���һЩ��Ϣ����1����Ա���ļ�������4����Ա��ʾ�Ƿ�Ϊ�ļ��С�
I_PU_subfolders2 = {I_PU_t2.name};
mm=0;
for iis=3:length(P_PU_subfolders2)  
      if P_PU_subfolders2{iis}==0
           continue
      end
      %%%%%%%%%%%%%%%           P_PU
      P_PU_pathname2 = [P_PU_Single_folder P_PU_subfolders2{iis}]; %%%%%    single
      P_PU_Single_data=importdata(P_PU_pathname2);
      P_PU_Single_feature_i_sum=sum(P_PU_Single_data);
      P_PU_SUM=sum((sum(P_PU_Single_data))')
      
      %%%%%%%%%%%%%%%          I_PU
      I_PU_pathname2 = [I_PU_Single_folder I_PU_subfolders2{iis}]; %%%%%    single
      I_PU_Single_data=importdata(I_PU_pathname2);
      I_PU_Single_feature_i_sum=sum(I_PU_Single_data);
      I_PU_SUM=sum((sum(I_PU_Single_data))')
      
      for numm = 1:25
          if numm==1 
                PU_Single_feature_i_sum(numm)=P_PU_Single_feature_i_sum(numm)+I_PU_Single_feature_i_sum(1);
          elseif numm==2 
                PU_Single_feature_i_sum(numm)=P_PU_Single_feature_i_sum(numm)+I_PU_Single_feature_i_sum(2);
            elseif numm==5 
                PU_Single_feature_i_sum(numm)=P_PU_Single_feature_i_sum(numm)+I_PU_Single_feature_i_sum(3);
            elseif numm==12 
                PU_Single_feature_i_sum(numm)=P_PU_Single_feature_i_sum(numm)+I_PU_Single_feature_i_sum(4);
            elseif numm==19
                PU_Single_feature_i_sum(numm)=P_PU_Single_feature_i_sum(numm)+I_PU_Single_feature_i_sum(5);
           else
                PU_Single_feature_i_sum(numm)=P_PU_Single_feature_i_sum(numm);
          end
      end
      
      SUM=P_PU_SUM+I_PU_SUM;
      PU_Single_feature_prob=PU_Single_feature_i_sum/SUM;
      
      Single_feature_prob=PU_Single_feature_prob;
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
  for x=1:25
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
    TrainData=zeros(72,25); %ѵ������
     TrainLabel=zeros(72,1);             %ѵ����ǩ
    %TestData=zeros(32,25);
   %TestLabel=zeros(32,1);
    TestData=zeros(14,25);
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
 
