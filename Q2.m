data = importdata("C:\Users\abhin\Downloads\Experiment-6\Experiment-6\ECG_Data.txt");
f_data = filter(b,a,data)
fs = 720;
t = (0:(length(data)-1))/fs;
figure;
plot(t,data)
hold on
plot(t,f_data)
hold off
title("ECG Data")
legend("Original ECG Data","Filtered ECG Data")
xlabel("Frequency")
ylabel("Amplitude")
