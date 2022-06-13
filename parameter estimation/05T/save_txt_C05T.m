fid=fopen('exp_Temp40_ga.txt','w');
fprintf(fid,'%f \n',par(1,:));
fclose(fid);

fid=fopen('exp_Temp40_fmin.txt','w');
fprintf(fid,'%f \n',estimates);
fclose(fid);
