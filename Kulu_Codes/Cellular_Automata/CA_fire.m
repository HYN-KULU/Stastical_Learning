clc
clear
n = 5;                           % �����ʾɭ�ֵľ����С
Plight = 5e-6; Pgrowth = 1e-2;     % ��������������ĸ���  
UL = [n,1:n-1]; DR = [2:n,1];      % �������������ھ�
veg=zeros(n,n);                    % ��ʼ����ʾɭ�ֵľ���
imh = image(cat(3,veg,veg,veg));   % ���ӻ���ʾɭ�ֵľ���
% veg = �յ�Ϊ0 �Ż�Ϊ1 ��ľΪ2
for i=1:3000 
    sum =(veg(UL,:)==1) + (veg(:,UL)==1)+(veg(:,DR)==1) +  (veg(DR,:)==1);  % ��������и����м����ھ����Ż��
% ���ݹ������ɭ�־����Ƿ���=�Ƿ���-�Ƿ��Ż����+�Ƿ�����������0-1���㣩
    veg = 2*(veg==2) - ( (veg==2) & (sum>0 |(rand(n,n)<Plight)) ) +2*((veg==0) & rand(n,n)<Pgrowth) ;  
    set(imh, 'cdata', cat(3,(veg==1),(veg==2),zeros(n)) )
    drawnow                         % ���ӻ���ʾɭ�ֵľ���
end