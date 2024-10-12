function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  mat = csvread(path);
  mat = mat(2:end, 2:end);
end
