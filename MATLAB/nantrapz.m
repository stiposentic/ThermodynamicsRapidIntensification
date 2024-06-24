function variable_AV = nantrapz(lon,variable0,dim0)
%debug code:
%disp(size(variable0))

if length(size(variable0))==3
    n = NaN(3,1);
    n(1) = size(variable0,1);
    n(2) = size(variable0,2);
    n(3) = size(variable0,3);
    
    if dim0 == 3
        n1 = 1;
        n2 = 2;
        temp = NaN(n(n1),n(n2));
        for i = 1:n(n1)
            for j = 1:n(n2)
                data = variable0(i,j,:);
                ind = ~isnan(data);
                x = double( lon(ind));
                y = data(ind);
                if sum(ind)<=1
                    temp(i,j) = NaN;
                else
%                                    disp(sum(ind))
%                    x
%                    y
                    z = trapz(x,y);
                    temp(i,j) = z;
                end
            end
        end
        variable_AV = temp;
    elseif dim0 == 2
        n1 = 1;
        n2 = 3;
        temp = NaN(n(n1),n(n2));
        for i = 1:n(n1)
            for j = 1:n(n2)
                data = variable0(i,:,j);
                ind = ~isnan(data);
                x = double( lon(ind));
                y = data(ind);
                if sum(ind)<1
                    temp(i,j) = NaN;
                else
                    z = trapz(x,y);
                    temp(i,j) = z;
                end
            end
        end
        variable_AV = temp;
    elseif dim0 == 1
        n1 = 2;
        n2 = 3;
        temp = NaN(n(n1),n(n2));
        for i = 1:n(n1)
            for j = 1:n(n2)
                data = variable0(:,i,j);
                ind = ~isnan(data);
                x = double( lon(ind));
                y = data(ind);
                disp(sum(ind))
                if sum(ind)<1
                    temp(i,j) = NaN;
                else
                    z = trapz(x,y);
                    temp(i,j) = z;
                end
            end
        end
        variable_AV = temp;
    end
    
elseif size(variable0,2)>1
    
    n = NaN(2,1);
    n(1) = size(variable0,1);
    n(2) = size(variable0,2);    

    if dim0 == 2
        n1 = 1;
        temp = NaN(n(n1),1);
        for i = 1:n(n1)
                data = variable0(i,:);
                ind = ~isnan(data);
                x = double( lon(ind));
                y = data(ind);
                if sum(ind)<1
                    temp(i) = NaN;
                else
                    if sum(ind) == 1
                        temp(i) = y;
                    else
                        z = trapz(x,y);
                        temp(i) = z;
                    end
                end
        end
        variable_AV = temp;
    elseif dim0 == 1
        n1 = 2;
        temp = NaN(n(n1),1);
        for i = 1:n(n1)
                data = variable0(:,i);
                ind = ~isnan(data);
                x = double( lon(ind));
                y = data(ind);
                if sum(ind)<1
                    temp(i) = NaN;
                else
                    z = trapz(x,y);
                    temp(i) = z;
                end
        end
        variable_AV = temp;
    end
elseif size(variable0,2)==1
    data = variable0;
    ind = ~isnan(data);
    x = double( lon(ind));
    y = data(ind);
    if sum(ind)<1
        temp = NaN;
    else
        z = trapz(x,y);
        temp = z;
    end
    variable_AV = temp;
end
