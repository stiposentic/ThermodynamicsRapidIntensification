function var = loadvar(file,name)

var = ncread(file,name);
var(var>0.9e30) = NaN;
var = double(var);