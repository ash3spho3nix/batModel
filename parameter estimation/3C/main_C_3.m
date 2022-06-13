GA3
fmins_C3
save_txt_C3

A=[[1:33];hi;lo;par(1,:);estimates];
fileID = fopen('exp_c3_total.txt','w');
fprintf(fileID,'%6s %12s %12s % 12s %12s\r\n','Sno','Hi','Lo','Par','Estimates');
fprintf(fileID,'%6f %12f %12f %12.8f %12.8f\r\n',A);
fclose(fileID);
A'