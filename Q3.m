[x Fs] = audioread("C:\Users\abhin\Downloads\Experiment-6\Experiment-6\instru1.wav");

m = abs(fft(y));
F = (0:length(m)-1)*Fs/length(m);
figure;
plot(F,m)
title('Instrument - 1')
xlabel("Frequency");
ylabel("Amplitude");
fft1 = fft(x);
l1 = length(fft1);
mag1 = abs(fft1);
freq = (0:(l1-1))*(Fs/l1);
[~,peak] = max(mag1);
fund_f = freq(peak)

window_length = 100; 
overlap = 10;       
window_length_2 = 150;

l = fund_f-40;
h = fund_f+40;
[A,B,C,D] = butter(8,[l h]/(Fs/2),"bandpass");
d1 = designfilt("bandpassiir",FilterOrder=8,HalfPowerFrequency1=l,HalfPowerFrequency2=h,SampleRate=Fs);
sos = ss2sos(A,B,C,D);
fvt = fvtool(sos);
legend(fvt,"butter")

filtered_audio = filtfilt(d1,x);
audiowrite('filtered_audio.wav', filtered_audio, Fs);
sound(filtered_audio, Fs);

figure;
spectrogram(x, hamming(window_length), overlap);
axis xy
title('Spectrogram of Instrument-1');

figure;
[y1 Fs] = audioread("filtered_audio.wav");
spectrogram(y1, hamming(window_length), overlap);
axis xy
title('Filtered Output of Instrument-1');
