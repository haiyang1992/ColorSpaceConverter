k=input('Enter the file name: ','s'); % input image;
fid=fopen('lena.coe','w+');
if -1 ==fid
error('Failed to open', 'filename');
end
fprintf(fid,'memory_initialization_radix=10;\nmemory_initialization_vector=\n');
im=imread(k);
[m n]=size(im);
a=zeros(m*n,1);
l=1;
for i=1:m
    for j=1:n
        a(l)=im(i,j);
        l=l+1;
    end
end
for i=1:l-2
    fprintf(fid,'%d,\n',a(i));
end
fprintf(fid,'%d;',a(l-1));
fclose(fid);