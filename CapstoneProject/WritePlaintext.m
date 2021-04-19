function WritePlaintext(result, path)
    if length(size(result)) == 2
        result = reshape(result',1,[]);
    elseif length(size(result)) > 2
        error("result input must be of dimension 1 or 2")
    end
    
    fileID = fopen(path, 'w');
    fmt = "%7.7f";
    formatSpec = fmt;
    for i = 1:length(result)-1
        formatSpec = formatSpec + " " + fmt;
    end
    fprintf(fileID, formatSpec, result);
end