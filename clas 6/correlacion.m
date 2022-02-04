clc, clear all
x=[8.9,2,3.4,90,88]
y=[12,22.5,24,45,68]
n=length(x);
%caso1
for i=1:n
    x2(i)=x(i+i-1)
    
    xy[i]=y.*x2
end

    