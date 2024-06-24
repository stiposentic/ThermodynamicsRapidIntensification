function [indAfter, xout, fout] = findIndicesLine(x1,y1,x2,y2,stormDataIn,offset)

f = @(x) y1+(x-x1)*(y2-y1)/(x2-x1);
indAfter = zeros(size(stormDataIn,1),1);
for i = 1:size(stormDataIn,1)
    f1 = f(stormDataIn(i,12))+offset;
    % check if ii greater than the f
    if stormDataIn(i,9)<=f1
        indAfter(i) = logical(1);
    end
end
indAfter = logical(indAfter);
fout = f(stormDataIn(i,12))+offset;
xout = stormDataIn(i,12);
