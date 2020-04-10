% =================================================================================%
% 5 DOF Kinematics
% =================================================================================%

%====================================================


qdmax = [1 1 1 1 1];
velocity = 0.1;
acceleration = 0.8;  
K = {'r', 'LineWidth', 2};

L1 = 735;
L2 = 700;
L3 = 700;
L4 = 700;
L5 = 100; 


SL(1) = Link([0,L1,0,pi/2]);
SL(2) = Link([0,0,L2,0]);
SL(3) = Link([0,0,L3,0]);
SL(4) = Link([0,0,L4,pi/2]);
SL(5) = Link([0,L5,0,0]); 

Robot = SerialLink(SL);
%Robot.plot([t1  t2  t3 t4 t5]);

point1 = [600 -400 0];   %[400 -900 0]
point2 = [600 800 0];   % [300 500 0]
point3 = [1300 600 300];   % [300 500 0]
point4 = [1000 -500 1000];   % [300 500 0]
point5 = [2000 400 1000];

M1 = transl(point1) * trotx(180, 'deg');
M2 = transl(point2) * trotx(180, 'deg');
M3 = transl(point3) * trotx(180, 'deg');
M4 = transl(point4) * trotx(180, 'deg');
M5 = transl(point5) * trotx(180, 'deg');
%disp(TT1);
mask =  [1 1 1 1 1 0];

%=========================Robot Inverse Kinematics start here
q1 = Robot.ikine(M1, 'mask', mask );
q2 = Robot.ikine(M2, 'mask', mask );
q3 = Robot.ikine(M3, 'mask', mask);
q4 = Robot.ikine(M4, 'mask', mask);
q5 = Robot.ikine(M5, 'mask', mask);

%=========================Robot Inverse Kinematics end here

P1 = q1(1, : );
P2 = q2(1, : );
P3 = q3(1, : );
P4 = q4(1, : );
P5 = q5(1, : );

Path12 = [P1; P2];
Path23 = [P2; P3];
Path21 = [P2; P1];
Path13 = [P1; P3];
Path34 = [P3; P4];
Path45 = [P4; P5];

finalPath = [Path21; Path13; Path34; Path45];

%%%  ============================================Free Motion Trajectory Starts Here

A = mstraj( finalPath, qdmax, [],[],velocity,acceleration); %trajectory
%subplot(2,2,2); 
Robot.plot(A, 'trail', K);


%%% =============================================Free Motion Trajectory Starts Here


%%%============================================= Straight Line Trajectory Starts Here

%subplot(2,2,1);
Robot.plot(finalPath, 'trail', K);

%%%=============================================  Straight Line Trajectory Ends Here



%%% =============================================Obstacle Avoidance Trajectory Starts Here

newPath =jtraj(q4, q5, 50); 
obstacleAvoidingPath = [ Path21; Path13; Path34; newPath];       %%%
%subplot(2,2,3); 
Robot.plot(obstacleAvoidingPath, 'trail', K);

%%%=============================================  Obstacle Avoidance Trajectory Ends Here



%subplot(2,2,2); Robot.plot(A, 'trail', K);  
%subplot(2,2,3); Robot.plot(obstacleAvoidPath, 'trail', K);





%Q = jtraj(S1, S2, 50);
%Robot.plot(Q);









% =================================================================================%
% 3 DOF Kinematics
% =================================================================================%


%L_1 = 20;
%L_2 = 50;
%L_3 = 40;



%L (1) = Link([0 L_1 0 pi/2]);
%L (2) = Link([0 0 L_2 0]);
%L (3) = Link([0 0 L_3 0]);


%Robot1 = SerialLink(L);
%Robot1.name = 'Lynx Motion Robot'; 
%Robot.plot([t1 t2 t3]);            

%Tz1  = Robot1.fkine([t1 t2 t3]);     %% Forward Kinematics 
%Tz2  = Robot1.fkine([40 60 80]); 

%trplot(T);    %% trplot(T, options) draws a 3D coordinate frame represented by the homogeneous transform T (4x4).

%disp(Tz1); disp(Tz2);




%T1 = ctraj(Tz1, Tz2, 50); % compute a Cartesian path
%q1 = Robot.ikine(T,[0, 0, 0, 90, 0, 0]);


%Robot.plot(q);








%Tz (1) = Robot.fkine([30, 40, 0, 90, 0, 60]);
%Tz (2) = Robot.fkine([0, 20, 0, 120, 0, 15]);
%Tz (3) = Robot.fkine([-23, -14, 5, 34, 0, 78]);
%Tz (4) = Robot.fkine([16, 0, 56, -10, 10, 45]);

%d = Robot.ikine([60, 90, 0])*pi/180;
%disp(d);


%for h = 1 : 4
%    T = ctraj(Tz (h), Tz (h+1), 5);
%    q = Robot.ikine(T,[0, 0, 0, 90, 0, 0]);
%       Robot.plot(q)
%    pause(1.123);
%end
 




%T = ctraj(Tz1, Tz2, 5); % compute a Cartesian path of 50 points 
%disp(Tz1);
%disp(Tz2);
%q = Robot.ikine(T,[0, 0, 0, 90, 0, 0]);
%Robot.plot(q)





