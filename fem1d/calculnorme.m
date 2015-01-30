function [normeL2,seminormeH1]=calculnorme(adress,uexact,x,u,FctBases)

foncth = @(x) 0+0*x;
fonctf = @(x) 0+0*x;

err = u - uexact(x');

% Norme L2
fonctq = @(x) 0+0*x;
fonctp = @(x) 1+0*x;

[A,B] = CalculGlobal(fonctq,foncth,fonctp,fonctf,x,adress,FctBases);

normeL2 = sqrt(err'*A*err);


% Semi-norme H1
fonctq = @(x) 1+0*x;
fonctp = @(x) 0+0*x;

[A,B] = CalculGlobal(fonctq,foncth,fonctp,fonctf,x,adress,FctBases);

seminormeH1 = sqrt(err'*A*err);

end
