fid=fopen('exp_c05_ga.txt','w');
fprintf(fid,'%f \n',par(1,:));
fclose(fid);

fid=fopen('exp_c05_fmin.txt','w');
fprintf(fid,'%f \n',estimates);
fclose(fid);
