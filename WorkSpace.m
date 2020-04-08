
double theta;
double alpha;
double r;
double  d;

syms theta_1 theta_2 theta_3 theta_4 theta_5

alphaVector = [90 0 0 -90 0] * pi/180;

LinkVector = [15 10 7 5 35];     % Length of all the links go here.

% Start of DH Matrix in the order of  Theta, alpha, r and d %         

dhMatrix = [  theta_1                  alphaVector(1)                 0                     LinkVector(1);
                       theta_2                  alphaVector(2)         LinkVector(2)               0;
                       theta_3                  alphaVector(3)         LinkVector(3)               0;
                       theta_4 + pi/2      alphaVector(4)         LinkVector(4)               0         
                       theta_5                  alphaVector(5)                 0                      LinkVector(5) ];              
                   
rowCount = size(dhMatrix, 1);

productMatrix = eye(4);
%cellArray = cell(rowCount, 1) ;

for c = 1 : (rowCount)
    
    theta =  dhMatrix(c, 1);
    alpha = dhMatrix(c, 2);
    r = dhMatrix(c, 3);
    d = dhMatrix(c, 4);
    %cellArray{c} = homMatrix(theta, alpha, r, d)  ;
    
    productMatrix =  productMatrix * homMatrix(theta, alpha, r, d) ;    %% Final Transformation matrix
end

transVector = productMatrix(1:3, 4);
disp("Translation vector is below")
disp(transVector);
 X = transVector(1);
 Y = transVector(2);
 Z = transVector(3);
 
 
 theta_5 = 45;
for theta_4 = -90: 20 : 90
    for theta_3 = -135: 20 : 0
        for theta_2 = 0 : 20 : 180
            for theta_1 = -90 : 20 : 90
                
                        %X_ = subs(X, {theta_1,theta_2,theta_3, theta_4, theta_5},{th_1,th_2,th_3,th_4,th_5});
                        %Y_ = subs(Y, {theta_1,theta_2,theta_3, theta_4, theta_5},{th_1,th_2,th_3,th_4,th_5});
                        %Z_ = subs(Z, {theta_1,theta_2,theta_3, theta_4, theta_5},{th_1,th_2,th_3,th_4,th_5});
                
                X = 10*cos(theta_1)*cos(theta_2) - 35*cos(theta_4 + pi/2)*(cos(theta_1)*cos(theta_2)*sin(theta_3) + cos(theta_1)*cos(theta_3)*sin(theta_2)) - 5*cos(theta_4 + pi/2)*(cos(theta_1)*sin(theta_2)*sin(theta_3) - cos(theta_1)*cos(theta_2)*cos(theta_3)) - 5*sin(theta_4 + pi/2)*(cos(theta_1)*cos(theta_2)*sin(theta_3) + cos(theta_1)*cos(theta_3)*sin(theta_2)) + 35*sin(theta_4 + pi/2)*(cos(theta_1)*sin(theta_2)*sin(theta_3) - cos(theta_1)*cos(theta_2)*cos(theta_3)) - 7*cos(theta_1)*sin(theta_2)*sin(theta_3) + 7*cos(theta_1)*cos(theta_2)*cos(theta_3);
                Y = 10*cos(theta_2)*sin(theta_1) - 35*cos(theta_4 + pi/2)*(cos(theta_2)*sin(theta_1)*sin(theta_3) + cos(theta_3)*sin(theta_1)*sin(theta_2)) - 5*cos(theta_4 + pi/2)*(sin(theta_1)*sin(theta_2)*sin(theta_3) - cos(theta_2)*cos(theta_3)*sin(theta_1)) - 5*sin(theta_4 + pi/2)*(cos(theta_2)*sin(theta_1)*sin(theta_3) + cos(theta_3)*sin(theta_1)*sin(theta_2)) + 35*sin(theta_4 + pi/2)*(sin(theta_1)*sin(theta_2)*sin(theta_3) - cos(theta_2)*cos(theta_3)*sin(theta_1)) - 7*sin(theta_1)*sin(theta_2)*sin(theta_3) + 7*cos(theta_2)*cos(theta_3)*sin(theta_1);
                Z = 10*sin(theta_2) + 7*cos(theta_2)*sin(theta_3) + 7*cos(theta_3)*sin(theta_2) + 5*cos(theta_4 + pi/2)*(cos(theta_2)*sin(theta_3) + cos(theta_3)*sin(theta_2)) + 35*cos(theta_4 + pi/2)*(cos(theta_2)*cos(theta_3) - sin(theta_2)*sin(theta_3)) - 35*sin(theta_4 + pi/2)*(cos(theta_2)*sin(theta_3) + cos(theta_3)*sin(theta_2)) + 5*sin(theta_4 + pi/2)*(cos(theta_2)*cos(theta_3) - sin(theta_2)*sin(theta_3)) + 15;
                
                plot3 (double(X), double(Y), double(Z) ,'.' , 'Color', [255, 153, 51] / 255)
                %plot (double(X), double(Y) ,'.' , 'Color', [255, 153, 51] / 255)
                %plot (double(Y), double(Z) ,  '.' , 'Color', [255, 153, 51] / 255)
                %plot (double(X), double(Z) , '.' , 'Color', [255, 153, 51] / 255)
                hold on
            end
        end
     end
end




 
 %newX = char(transVector(1));
 %newX = double(strrep(newX,'*','.*'));
 
 %newY = char(transVector(2));
 %newY = double(strrep(newY,'*','.*'));
 
 %newZ = char(transVector(3));
 %newZ = double(strrep(newZ,'*','.*'));
 


 %p1 = linspace(0, 270 , 10);
 %p2 = linspace(-45,45,10);
 %p3 = linspace(30,170,10);
 %p4 = linspace(-70,80,10);
 %p5 = linspace(0,300,10);
 
 %[theta_1,theta_2,theta_3, theta_4, theta_5] = ndgrid(p1,p2,p3,p4, p5);
 
%plot3(X(:), Y(:), Z(:));
 
















