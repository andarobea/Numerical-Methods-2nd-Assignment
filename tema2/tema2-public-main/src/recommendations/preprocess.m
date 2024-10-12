function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  [m, n] = size(mat);
  keep = false(m, 1);
  for i = 1 : m
      sum_rew = sum(mat(i,:) > 0);
      if sum_rew >= min_reviews
        keep(i) = true;
      endif
  end
  reduced_mat = mat(keep, :);
end
