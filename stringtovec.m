function [v] = stringtovec(s)


[m,n]=size(s);

if(m==1) 
    s=s';
end
len1=length(s);
len = strlength(s(1,1));
v=zeros(len1,len);

for i=1:len1
    for j=1:len
        v(i,j)=str2num(extractBetween(s(i,1),j,j));
    end
end
end

