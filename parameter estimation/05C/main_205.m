GA05
fmins_C05
save_txt_C05

A=[[1:33];hi;lo;par(1,:);estimates];
fileID = fopen('exp_c05_total.txt','w');
fprintf(fileID,'%6s %12s %12s % 12s %12s\r\n','Sno','Hi','Lo','Par','Estimates');
fprintf(fileID,'%6f %12f %12f %12.8f %12.8f\r\n',A);
fclose(fileID);
A'