function [output]=alphanumeric_order(input)
% ALPHANUMERIC_ORDER is a function to sort elements of a structure, cell array
% or string array in alphanumeric order. If the input is a char, it must be
% the path that contains the elements to reorder and the output will be a
% structure with elements in alphanumeric order.
% 
% Input must be:
% > struct obtained with "dir(path)"
% > char indicating the path that contains the elements to reorder
% > string or cell array that contains the elements to reorder
% Output is a variable that contains the elements of the input reordered
% alphabetically and with numbers in natural order.
%
% Utility: if you have char elements in a variable that contains numbers, by
% default numbers are interpreted also as char and the order is not
% natural. Example of order by default: 
%   A={'element5','element1','element10'};
%   A_defaultsort= sort(A); A_defaultsort={'element1','element10','element5'};
%   A_naturalsort= naturalsort_reorder(A); A_naturalsort={'element1','element5','element10'};
% 
% Author: Marina Fernandez-Alvarez
% marina.fdez.alvarez@gmail.com
%

    if isstruct(input)
        output=input; % copy structure
        for num=1:length(input)
            cell_name(num,1) = {input(num).name};
        end
        cell_name=natsortfiles(cell_name);
        for num=1:length(input)
            output(num).name = char(cell_name(num,1));
        end   

    elseif ischar(input)
        if ~isdir(input); error(['"' input '" is not a directory']); end
        input=dir(input); 
        output=input; % copy structure
        for num=1:length(input)
            cell_name(num,1) = {input(num).name};
        end
        cell_name=natsortfiles(cell_name);
        for num=1:length(input)
            output(num).name = char(cell_name(num,1));
        end  

    elseif isstring(input)
        input=cellstr(input); 
        output=input; % copy structure
        if size(input,1)>size(input,2)
            for num=1:length(input)
                cell_name(num,1) = {input(num)};
            end
            cell_name=natsortfiles(cell_name);
            for num=1:length(input)
                output(num) = char(cell_name(num,1));
            end  
        else
            for num=1:length(input)
                cell_name(1,num) = {input(num)};
            end
            cell_name=natsortfiles(cell_name);
            for num=1:length(input)
                output(num) = char(cell_name(1,num));
            end  
        end
    elseif iscell(input) 
        output=natsortfiles(input); 

    else
        error(['Input must be:' newline,...
            '> struct obtained with "dir(path)"' newline,...
            '> char indicating the path that contains the elements to reorder alphabetically' newline,...
            '> cell that contains the elements to reorder alphabetically'])
    end

end
