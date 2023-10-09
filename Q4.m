fs= 720;
Wpb = 10/(fs/2);
Wsb = 20/(fs/2);
[nb,Wnb] = buttord(Wpb,Wsb,2,40);
[b_b,a_b]=butter(n,Wnb);
sys_b=tf(bb,ab,1/Fs);

Wpc = 10/(fs/2);
Wsc = 20/(fs/2);
[nc,Wpc] = cheb1ord(Wpc,Wsc,2,40)
[b,a]=cheby1(n,2,Wpc);
% tra
sys=tf(b,a,1/Fs);

subplot(2,1,1)
zplane(b,a)
title("Chebyshev")
subplot(2,1,2)
zplane(b_b,a_b)
title("Butterworth")

figure;
F = linspace(0,50,100);
[mag,phase] = bode(sys,2*pi*F);
plot(F,db(squeeze(mag)))
title("Chebyshev Filter")
legend("Bode plot (Chebyshev)")
xlabel("Frequency")
ylabel("Magnitude (dB)")
hold on
[mag_b,phase_b] = bode(sys_b,2*pi*F);
plot(F,db(squeeze(mag_b)))
legend("Bode plot (Chebyshev)","Bode plot (Butterworth)")
hold off

figure;
impz(b,a);
hold on
impz(b_b,a_b);
legend("Impulse Response (Chebyshev)","Impulse (Butterworth)")
title('Impulse Response');
hold off
figure;
stepz(b,a);
hold on
legend("Step (Chebyshev)")
stepz(b_b,a_b);
legend("Step Response (Chebyshev)","Step Response (Butterworth)")
title('Step Response');
hold off
