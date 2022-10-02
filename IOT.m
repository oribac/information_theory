clear; close all; clc;

% capture new measurement
M = readmatrix('temprature_data.csv');
N = size(M);

d = nan(N);
C_i = [];

% The minimum value of set M
miu_min = min(M);

% create difference vector and round to closest number
for j = 1:N
    d(j)= M(j) - miu_min;
    d(j) = uint8(d(j));    
end

% find rho - highest difference
rho = max(d);

for j = 1:N
    C_i{j} = dict(d(j));
end


function [C_i] = dict(d_val)
    if d_val == 0
        C_i = '00';
    elseif d_val == 1
        C_i = '011';
    elseif  d_val == 2
        C_i = '010';
    elseif d_val == 3
        C_i = '1011';
    elseif d_val == 4
        C_i = '1000';
    elseif d_val == 5
        C_i = '1001';
    elseif d_val == 6
        C_i = '1010';
    elseif d_val > 6
        C_i = '1111';
    end
end
