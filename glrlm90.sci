clear; //hapus semua variable yang tersimpan di memory
clc; //bersihkan console

//matriks_pixel_file_gambar=imread("");
//F=[0,0,1,1;0,0,1,1;0,2,2,2;2,2,3,3]
//F=grand(15,15,"uin",0,5);
[Nx,Ny]=size(F);
L1=unique(F)';
nL1=size(L1,"*");

maxrunlength90=Nx
GLRLM90=zeros(nL1,maxrunlength90)
for i=1:Nx
    for j=1:Ny
        graylevel=F(i,j)
        for l=1:nL1
            if L1(l)==graylevel then
                NoGrayLevel=l
            end
        end        
        if (i==1) || (i>1 & graylevel<>F(i-1,j)) then
           for k=i:maxrunlength90
               if F(k,j)==graylevel then
                  runlength=k-i+1
               else
                  break 
               end
           end
           GLRLM90(NoGrayLevel,runlength)=GLRLM90(NoGrayLevel,runlength)+1
        end
    end
end        
disp(F)
disp(GLRLM90)
