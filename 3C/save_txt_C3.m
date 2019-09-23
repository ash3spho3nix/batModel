fid=fopen('exp_c3_ga.txt','w');
fprintf(fid,'%f \n',par(1,:));
fclose(fid);

fid=fopen('exp_c3_fmin.txt','w');
fprintf(fid,'%f \n',estimates);
fclose(fid);
