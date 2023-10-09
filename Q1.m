a = 1+mod(231,3);
fs = 720;
f_edge = 10/(fs/2); 
f_stopband = 20/(fs/2);
f = linspace(0,20,100);

[n,Wn] = buttord(f_edge,f_stopband,a,40)

[b,a] = butter(n,Wn,"low")
figure;
h = tf(b,a,(1/fs))
zplane(b,a);
pzmap(h);


figure;
[mag,ph] = bode(h,2*pi*f);
plot(f,db(squeeze(mag)))
title("Butterworth Filter");
xlabel("Frequency");
ylabel("Magnitude (in dB)")

figure;
stepz(b,a,1000)
hold on
impz(b,a,1000)
hold off
title("Step vs Impluse Signal")
legend("Step Signal","Impulse Signal");
