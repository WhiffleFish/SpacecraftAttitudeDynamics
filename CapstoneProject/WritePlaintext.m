function WritePlaintext(result, path)
    fileID = fopen(path, 'w');
    fmt = "%7.7f";
    formatSpec = fmt;
    for i = 1:length(result)-1
        formatSpec = formatSpec + " " + fmt;
    end
    fprintf(fileID, formatSpec, result);
end