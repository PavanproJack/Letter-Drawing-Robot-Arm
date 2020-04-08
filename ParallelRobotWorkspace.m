clc
clear
 
%specifying the initial end-effector points xp, yp and orientation angle 
xe=300;ye=150;a=55;% orientation angle 'alpha'
 
LA1=170; % length of link 1 of arm i, i=1,2,3
LB1=130;%length of link 2 of arm i
lm1=130; % r
Rb=290;%base triangle (mm)
 
% initial base traingle points
x1=0;y1=0;
x2=sqrt(3)*Rb;y2=0;
x3=sqrt(3)*Rb/2;y3=1.5*Rb;
 
% rotation angle of Mi (3rd joint)
fi1=a+30;
fi2=a+150;
fi3=a+270;   
 
%rotational angle of Mi 
M1x_y=[xe - lm1*cosd(fi1),ye - lm1*sind(fi1)];
M2x_y=[xe - lm1*cosd(fi2),ye - lm1*sind(fi2)];
M3x_y=[xe - lm1*cosd(fi3),ye - lm1*sind(fi3)];
 
Ax1_y=sqrt((xe - lm1*cosd(fi1)-x1)^2+(ye - lm1*sind(fi1)-y1)^2);
Ax2_y=sqrt((xe - lm1*cosd(fi2)-x2)^2+(ye - lm1*sind(fi2)-y2)^2);
Ax3_y=sqrt((xe - lm1*cosd(fi3)-x3)^2+(ye - lm1*sind(fi3)-y3)^2);
 
% Calculating ci and di values for angle Qi of joint 1
c1=atan2d((M1x_y(2)),(M1x_y(1)));
d1=acosd((LA1^2-LB1^2+Ax1_y^2)/(2*LA1*Ax1_y));
c2=atan2d((M2x_y(2)-y2),(M2x_y(1)-x2));
d2=acosd((LA1^2-LB1^2+Ax2_y^2)/(2*LA1*Ax2_y));
c3=atan2d((M3x_y(2)-y3),(M3x_y(1)-x3));
d3=acosd((LA1^2-LB1^2+Ax3_y^2)/(2*LA1*Ax3_y));
 
%Theta values which has two solutions for each arms 
Q11(1)=c1+d1; Q11(2)=c1-d1;
Q12(1)=c2+d2; Q12(2)=c2-d2;
Q13(1)=c3+d3; Q13(2)=c3-d3;
 
% location of Bi - 2nd arm
B1x=LA1*cosd(Q11)+x1;
B1y=LA1*sind(Q11)+y1;
 
B2x=LA1*cosd(Q12)+x2;
B2y=LA1*sind(Q12)+y2;
 
B3x=LA1*cosd(Q13)+x3;
B3y=LA1*sind(Q13)+y3;
 
%Determining the rotation angle of Bi for 3 joints
B_Q21=(Ax1_y^2-LA1^2-LB1^2)/(2*LA1*LB1);
B_Q22=((Ax2_y)^2-LA1^2-LB1^2)/(2*LA1*LB1);
B_Q23=((Ax3_y)^2-LA1^2-LB1^2)/(2*LA1*LB1);
 
%Sci / rotational angle of joint 2 in degrees of all arms
sci21(1)=atan2d(sqrt(1-(B_Q21)^2), B_Q21);
sci21(2)=atan2d(-sqrt(1-(B_Q21)^2), B_Q21);
 
sci22(1)=atan2d(sqrt(1-(B_Q22)^2), B_Q22);
sci22(2)=atan2d(-sqrt(1-(B_Q22)^2), B_Q22);
 
sci23(1)=atan2d(sqrt(1-(B_Q23)^2), B_Q23);
sci23(2)=atan2d(-sqrt(1-(B_Q23)^2), B_Q23);
 
%%Plotting the Parallel robot
figure(1)
hold on; grid on;
title(['X=' num2str(xe) ' (mm), Y=' num2str(ye) ' (mm),  Alpha= ' num2str(a) ' (degree)'])
xlabel('x-axis'); ylabel('y-axis');
xlim([-50 600])
ylim([-50 500])
axis equal;
 
% base triangle
base_tri = [0 2*Rb*cosd(30) Rb*cosd(30) 0; 0 0 (Rb*sind(30) +Rb) 0];
 
% plotting platform
platform_tri=[M1x_y(1) M2x_y(1) M3x_y(1) M1x_y(1) ;M1x_y(2) M2x_y(2) M3x_y(2) M1x_y(2)];
plot (base_tri(1,:),base_tri(2,:),'k')
plot (platform_tri(1,:),platform_tri(2,:),'b')
plot(sind(60)*Rb,0.5*Rb,'bo','MarkerFaceColor','g','MarkerSize',3.5)
plot(xe,ye,'ro','MarkerFaceColor','r','MarkerSize',3.5)
 
arm_1=[x1 B1x(1) M1x_y(1); y1 B1y(1) M1x_y(2)];
arm_2=[x2 B2x(1) M2x_y(1); y2 B2y(1) M2x_y(2)];
arm_3=[x3 B3x(1) M3x_y(1); y3 B3y(1) M3x_y(2)];
 
plot(arm_1(1,:),arm_1(2,:))
plot(arm_2(1,:),arm_2(2,:))
plot(arm_3(1,:),arm_3(2,:))
 
clc
clear
xp = zeros(1,120);
yp = zeros(1,120);
 
 
%% Plotting the workspace for different alpha (a)
 
a=45;  %initialize alpha value(a)
 
LA1=170;
LB1=130;
lm1=130;
Rb=290;
 
x1=0;y1=0;
x2=sqrt(3)*Rb;y2=0;
x3=sqrt(3)*Rb/2;y3=1.5*Rb;
 
i=1;
 
for xp=5:5:600
    for yp=5:5:600
        
        fi1=a+30;
        fi2=a+150;
        fi3=a+270;
        
        M1x_y=[xp - lm1*cosd(fi1),yp - lm1*sind(fi1)];
        M2x_y=[xp - lm1*cosd(fi2),yp - lm1*sind(fi2)];
        M3x_y=[xp - lm1*cosd(fi3),yp - lm1*sind(fi3)];
        Ax1_y=sqrt((xp - lm1*cosd(fi1)-x1)^2+(yp - lm1*sind(fi1)-y1)^2);
        Ax2_y=sqrt((xp - lm1*cosd(fi2)-x2)^2+(yp - lm1*sind(fi2)-y2)^2);
        Ax3_y=sqrt((xp - lm1*cosd(fi3)-x3)^2+(yp - lm1*sind(fi3)-y3)^2);
        
        c1=atan2d((M1x_y(2)),(M1x_y(1)));
        d1=acosd((LA1^2-LB1^2+Ax1_y^2)/(2*LA1*Ax1_y));
        c2=atan2d((M2x_y(2)-y2),(M2x_y(1)-x2));
        d2=acosd((LA1^2-LB1^2+Ax2_y^2)/(2*LA1*Ax2_y));
        c3=atan2d((M3x_y(2)-y3),(M3x_y(1)-x3));
        d3=acosd((LA1^2-LB1^2+Ax3_y^2)/(2*LA1*Ax3_y));
        Q11(1)=c1+d1; Q11(2)=c1-d1;
        Q12(1)=c2+d2; Q12(2)=c2-d2;
        Q13(1)=c3+d3; Q13(2)=c3-d3;
        
        B_Q21=(Ax1_y^2-LA1^2-LB1^2)/(2*LA1*LB1);
        B_Q22=((Ax2_y)^2-LA1^2-LB1^2)/(2*LA1*LB1);
        B_Q23=((Ax3_y)^2-LA1^2-LB1^2)/(2*LA1*LB1);
        
       % Defining Singularity 
        if (B_Q21)^2>1||(B_Q22)^2>1||(B_Q23)^2>1
            fprintf('Out of reach, select different values');
        else
            X(i)=xp;
            Y(i)=yp;
            i=i+1;
        end
    end
end
 
%%%%%%%%%%%%%%%%%%%%%%%% workspace%%%%%%%%%%%%%%%%%%%%%5
figure(2)
base_tri = [0 2*Rb*cosd(30) Rb*cosd(30) 0; 0 0 (Rb*sind(30) +Rb) 0]; %plotting the base triangle
plot (base_tri(1,:),base_tri(2,:),'b')
hold on
grid on
xlim([-50 550])
ylim([-50 450])
axis equal
xlabel('x'); ylabel('y');
title(['Workspace - Alpha= ' num2str(a) ' (degree)'])
plot(X,Y, 'k*','MarkerSize',5)
