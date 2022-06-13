fid=fopen('exp_Temp0_ga.txt','w');
fprintf(fid,'%f \n',par(1,:));
fclose(fid);

fid=fopen('exp_Temp0_fmin.txt','w');
fprintf(fid,'%f \n',estimates);
fclose(fid);
