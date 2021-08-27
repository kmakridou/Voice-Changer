function saved_p()
disp ('Welcome to Voice Changer!!');%emfanizw to minima Welcome to Voice Changer!!
disp('You have to set your password. Press any key to continue');%emfanizw to minima mesa sta''
pause();%stamataw tin ektelsesi tou kwdika mexri o xristis na patisei kapoio koumpi

p = password ('Create', 'AlphaNum', 8);% thetw tin morfi pou thelw na exei o kwdikos mou 


p2 = password ('Query', 'AlphaNum');%xrisimopoiw tin metabliti p2 gia na mporesw na sigkrinw toys dyo kwdikous


if p == p2 % an einai idioi oi kwdikoi pou eisixthisan
    uiwait(warndlg('Access granted!', 'modal'));% na emfanizetai se morfi parathirou to minima Access Granded
    p = p2; %orizw tonn prwto kwdiko iso me ton deytero poy eisixthei apo ton xristi p = p2
    prompt = input ('For options press 1. For exit press 2: ', 's');%emfanizw to minima ayto kai perimenw apo ton xristi na pliktrologisei
    if strcmpi(prompt, '1')%an plikrologisei to 1
      main();%kalw tin main()
    elseif strcmpi (prompt, '2')%an pliktrologisei to 2 
      disp('Exiting..');%emfanizw to minima
    else% se alli periptosi
      disp('Try Again! For options press 1. For exit press 2');%emfanizw to minima
    endif
else% an oi kwdikoi den einai idioi 
    uiwait(warndlg('Access denied. 1 Try Left!', 'modal'));%emfanizei minima sfalmatos
    p2 = password ('Query', 'AlphaNum');%zitaei alli mia fora na ginei eisagwgi tou kwdikou
endif
end