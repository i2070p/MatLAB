clear;
image=double(imread('kierowca.png'));
J=jasnosc(image);
C=kontrast(image, J);

vx=-255:255;
figure;

for n=1:511,
    tAdd=image+(n-256);
    tAdd(tAdd>255)=255;
    tAdd(tAdd<0)=0;
    vJAdd(n)=jasnosc(tAdd);
    vCAdd(n)=kontrast(tAdd, vJAdd(n));
end
subplot(4,2,2);
t=image+100;
t1=image-50;
t(t>255)=255;
t1(t1<0)=0;
plot(vx, vJAdd, 100, jasnosc(t),'r-o',-50, jasnosc(t1),'b-o');
title('Jasność w zakeżności od dodanej stałej');
subplot(4,2,4);
plot(vx, vCAdd, 100, kontrast(t,jasnosc(t)),'r-o',-50, kontrast(t1,jasnosc(t1)),'b-o');
title('Kontrast w zakeżności od dodanej stałej');
vx=0:0.5:5;
for k=1:11,
    tMul=image*((k-1)/2);  
    tMul(tMul>255)=255;
    tMul(tMul<0)=0;
    vJMul(k)=jasnosc(tMul);
    vCMul(k)=kontrast(tMul, vJMul(k));
end
subplot(4,2,6);
t=image*2;
t1=image*1.5;
t(t>255)=255;
t1(t1>255)=255;
plot(vx, vJMul, 2, jasnosc(t),'r-o',1.5, jasnosc(t1),'b-o');
title('Jasnść w zakeżności od czynnika mnożenia');
subplot(4,2,8);
plot(vx, vCMul, 2, kontrast(t,jasnosc(t)),'r-o',1.5, kontrast(t1,jasnosc(t1)),'b-o');
title('Kontrast w zakeżności od czynnika mnożenia');
subplot(4,2,1);
imshow(uint8(image-50));
title('Image-50');
subplot(4,2,3);
imshow(uint8(image+100));
title('Image+100');
subplot(4,2,5);
imshow(uint8(image*1.7));
title('Image*1.7');
subplot(4,2,7);
imshow(uint8(image*2));
title('Image*2');

figure;
subplot(4,2,1);
imshow(uint8(image+30));
title('Dodanie 30');

subplot(4,2,2);
imshow(uint8(image-30));
title('Dodanie -30');

subplot(4,2,3);
imshow(uint8(image*1.5));
title('Mnozenie przez 1.5');

subplot(4,2,4);
imshow(uint8(image*0.5));
title('Mnozenie przez 0.5');

subplot(4,2,5);
imshow(uint8(image.^2));
title('Potgowanie (x^2)');

subplot(4,2,6);
imshow(uint8(sqrt(image)));
title('Pierwiastkowanie (sqrt)');

subplot(4,2,7);
imshow(uint8(log(image)));
title('Logarytmowanie (log)');
