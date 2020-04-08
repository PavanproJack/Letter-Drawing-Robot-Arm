function [homTransMatrix] = homMatrix(theta, alpha,  r,  d)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



homTransMatrix = [  cos(theta)    -sin(theta)*cos(alpha)    sin(theta)*sin(alpha)     r * cos(theta);
                                     sin(theta)     cos(theta)*cos(alpha)   -cos(theta)*sin(alpha)    r * sin(theta);
                                     0                   sin(alpha)                        cos(alpha)                      d;
                                     0                   0                                       0                                     1                           ];
%disp(homTransMatrix);
end

