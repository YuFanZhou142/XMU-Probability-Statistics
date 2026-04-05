function ensure_directory(directory_path)
%ENSURE_DIRECTORY Create a directory when it does not already exist.

if ~exist(directory_path, 'dir')
    mkdir(directory_path);
end
end
