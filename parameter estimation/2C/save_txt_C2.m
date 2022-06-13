fid=fopen('exp_c2_ga.txt','w');
fprintf(fid,'%f \n',par(1,:));
fclose(fid);

fid=fopen('exp_c2_fmin.txt','w');
fprintf(fid,'%f \n',estimates);
fclose(fid);
