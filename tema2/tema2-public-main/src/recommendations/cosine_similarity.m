function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  A = A / norm(A);
  B = B / norm(B);
  similarity = A' * B;
end
