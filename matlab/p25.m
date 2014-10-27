function [] = problem25()

phi = (1.0 + sqrt(5)) / 2.0;

n = round((1000.0 + log10(1 / sqrt(5))) / (log10(phi)));

disp(n);

end % end main function