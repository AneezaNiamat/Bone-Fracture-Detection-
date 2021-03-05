figure(3)
load('test01_00sm')
plot(val(1,:))
windowsize=10;
b=(1/windowsize)*ones(1,windowsize);
a=1;
y=filter(b,a,val(1,:));
plot(y);legend('filtered ECG data');
xlabel('samples')
ylabel('Electrical activity')
title('ECG signal with moving artifacts')
beat_count=0;
for k=2:length(y)-1
    if (y(k)>y(k-1)&y(k)>y(k+1)&y(k)>1)
        %k
        %disp('prominant peak found');
        beat_count=beat_count+1;
        
    end
end
%divide the beats counted by the signal duration (in minutes)

fs=100;
N=length(y);
duration_in_seconds=N/fs;
duration_in_minutes=duration_in_seconds/60;
BPM=beat_count/duration_in_minutes 
figure(4)
load('cu01m.mat')
plot(val(1,:));
z=val(1,:);
xlabel('samples');
ylabel('Electrical Activity');
title('tachycardia');

%subplot(2,1,2);plot(z);legend('tachycardia')
%subplot(2,1,1);plot(y);legend('Normal ECG')
beat_count=0;
for k=2:length(z)-1
    if (z(k)>z(k-1)&z(k)>z(k+1)&z(k)>1)
        %k
        %disp('prominant peak found');
        beat_count=beat_count+1;
end
end

%divide the beats counted by the signal duration (in minutes)
fs=100;
N=length(z);
duration_in_seconds=N/fs;
duration_in_minutes=duration_in_seconds/60;
BPM=beat_count/duration_in_minutes
figure(5)
load('100m.mat')
plot(val(1,:));
f=val(1,:);
xlabel('samples');
ylabel('Electrical Activity');
title('cardiac death');

subplot(3,1,2);plot(z);legend('tachycardia')
subplot(3,1,1);plot(y);legend('Normal ECG')
subplot(3,1,3);plot(f);legend('cardiac death')
beat_count=0;
for k=2:length(f)-1
    if (f(k)>f(k-1)&f(k)>f(k+1)&f(k)>1)
        %k
        %disp('prominant peak found');
        beat_count=beat_count+1;
end
end

%divide the beats counted by the signal duration (in minutes)
fs=100;
N=length(f);
duration_in_seconds=N/fs;
duration_in_minutes=duration_in_seconds/60;
BPM=beat_count/duration_in_minutes
BPM=q;
q=20,20,60,80,200,300,400;

  
 if q >= 100 
    
   fprintf ('ECG is diagnosed with Tachycardia');
 
    

 elseif  q < 60 
   fprintf ('ECG is AbNormal');

    
 
elseif  q >= 60 || q <= 90
    
   fprintf ('ECG is Normal');
 

end  




