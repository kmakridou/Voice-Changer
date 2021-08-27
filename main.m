function main()  
    
    disp ('You will be asked to record a 5 second voice sample, which will be processed.');%dinw odigies ston xristi
    disp('If you want to proceed press any key.');%odigies ston xristi
    pause();%pausi ektelesis. me to patima opoioudipote koumpiou sinexizei apo auto to simeio i ektelesi tou kwdika
    
    
    % se auto to simeio ginetai ksekina i diadikasia tis ixografisis
    
    dev = audiodevinfo;%pairnw ta stoixeia tis syskevis
    recorded = audiorecorder(44100, 16, 1);%dimiourgw to ixografimeno arxeio(sixnotita, bits)
    disp('Start Recording');%emfanizetai to minima Start Recording
    recordblocking(recorded, 5);%ixografw 5 deuterolepta
    disp('Stop Recording');%emfanizw to minima stop recording
    y = getaudiodata(recorded);%pairnw ta stoixeia tou ixografimenou arxeiou
    plot(y);%emfanizw ena sxima pou anaparista to ixografimeno arxeio
    audiowrite('C:/VoiceChanger/Recorded.wav', y, 44100);% apothikevw to arxeio mou sto C:/VoiceChanger me to onoma Recorded.wav, periexontai ta stoixeia tou kai h sixnotita

    
    disp ('Press any key to continue');%emfanizw ston xristi to minima Press any key to continue
    pause();%pausi ektelesis. me to patima opoioudipote koumpiou sinexizei apo auto to simeio i ektelesi tou kwdika
  
  
    disp('Listen to your recorded voice sample');%mefanizei to minima Listen to your recorded voice sample
    [y, fs] = audioread('Recorded.wav');%fortwnetai to ixografimeno arxeio
    soundsc(y, fs);%anaparagwgi tou arxeiou Recorded.wav
    
    %emfanizei ta parakatw minimata
    disp('If you want to change your voice in 1.25 x speed, press 1.'); 
    disp('If you want to change your voice in 2 x speed, press 2.');
    disp('If you want to change your voice in 0.75 x speed, press 3.');
    disp('If you want to change your voice in 0.5 x speed, press 4.');
    
    %emfanizei tin protasi prin to komma kai meta oti parei ws input apo ton xristi
    prompt = input ('Enter your preference (1,2,3,4): ', 's');
    if strcmpi (prompt, '1')%an parei ws eisodo to 1
      file = 'C:/VoiceChanger/Processed.wav';%thetw san file to arxeio recorded
      audiowrite(file, y, 1.25*fs) % dilwnw ta stoixeia toy arxeio kai pollaplasiazw tin sixnotita me 1.25 
      disp('Now listen to your processed voice sample');%emfanizw ston xristi to minima Now listen to your processed voice sample
      [y, fs] = audioread('Processed.wav'); %fortwnetai to epeksergasmeno arxeio tis ixografisis(Processed.wav)
      soundsc(y, fs);%anaparagwgi tou arxeiou Processed.wav
   
    elseif strcmpi (prompt, '2')% an o xristis pliktrologisei to 2%% omoia me to parapanw
      file = 'C:/VoiceChanger/Processed.wav';
      audiowrite(file, y, 2*fs)%pollaplasiazw tin sixnotita *2
      disp('Now listen to your processed voice sample');%emfanizw ston xristi to minima Now listen to your processed voice sample
      [y, fs] = audioread('Processed.wav'); %fortwnetai to epeksergasmeno arxeio tis ixografisis
      soundsc(y, fs);%anaparagwgi tou arxeiou Processed.wav
   
    elseif strcmpi (prompt, '3')%an o xristiw pliktrologisei 3, omoia me 1,2
      file = 'C:/VoiceChanger/Processed.wav';
      audiowrite(file, y, 0.75*fs) %pollaplasiazw me 0.25 tin sixnotita, ginetai pio varia h fwnh
      disp('Now listen to your processed voice sample');%emfanizw ston xristi to minima Now listen to your processed voice sample
      [y, fs] = audioread('Processed.wav'); %fortwnetai to epeksergasmeno arxeio tis ixografisis
      soundsc(y, fs);%anaparagwgi tou arxeiou Processed.wav
   
    elseif strcmpi (prompt, '4')%an pliktrologisei 4, omoia me ta parapanw, idia diadikasia.
      file = 'C:/VoiceChanger/Processed.wav';
      audiowrite(file, y, 0.5*fs)%pollaplasiazw tin sixnotita me 0.5
      disp('Now listen to your processed voice sample');%emfanizw ston xristi to minima Now listen to your processed voice sample
      [y, fs] = audioread('Processed.wav'); %fortwnetai to epeksergasmeno arxeio tis ixografisis
      soundsc(y, fs);%anaparagwgi tou arxeiou Processed.wav
    else %se opoia alli periptwsi emfanizei to parakatw minima
      disp('Try Again, press 1,2,3,4');
    endif
    
    disp ('Press any key to continue');%emfanizw ston xristi to minima Press any key to continue
    pause(); %pausi ektelesis. me to patima opoioudipote koumpiou sinexizei apo auto to simeio i ektelesi tou kwdika
    disp('Thank you for using Voice Changer'); %emfanizei auto to minima
    
endfunction