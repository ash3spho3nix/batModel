GA05T
fmins_C05T
save_txt_C05T

A=[[1:34];hi;lo;par(1,:);estimates];
fileID = fopen('exp_T40_total.txt','w');
fprintf(fileID,'%6s %12s %12s % 12s %12s\r\n','Sno','Hi','Lo','Par','Estimates');
fprintf(fileID,'%6f %12f %12f %12.8f %12.8f\r\n',A);
fclose(fileID);
A'