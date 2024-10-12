function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  recoms = zeros(num_recoms,1);
  mat = read_mat(path);
  reduced_mat = preprocess(mat, min_reviews); % obtin matricea redusa
  [U, S, V] = svds(reduced_mat, num_features);  % algoritm SVD
  l = length(V);
  similarities = zeros(l,1);
  idx = zeros(l,1);
  for i = 1 : l   % calculez similaritatile intre toate temele si liked_theme
    idx(i) = i;   % pentru accesarea mai usoara a indicelui
    similarities(i) = cosine_similarity(V(i,:)', V(liked_theme,:)');  % pun in vector
  end
  for i = 1 : l - 1   % bubble sort pe vectorul de similaritati
    for j = (i + 1) : l
        if similarities(i) < similarities(j)  % ordonez sim descrescator
            aux = similarities(i);
            similarities(i) = similarities(j);
            similarities(j) = aux;

            aux = idx(i);   % ordonez indicii
            idx(i) = idx(j);
            idx(j) = aux;
        endif
    endfor
  endfor
  % pe prima pozitie va fi liked_theme cu similaritate 1
  % salvez indicii de la 2 la num_recoms
  for i = 2 : num_recoms + 1  % retin cele mai votate num_recoms teme
    recoms(i - 1) = idx(i);
  end
  recoms = recoms'; % vectorul recoms va fi vector linie
  
end
