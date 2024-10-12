function signal = low_pass(signal, fs, cutoff_freq)

  ft_of_signal = zeros(length(signal), 1);  % Compute the Fourier Transform of the signal x.
  ft_of_signal = fft(signal);

  freq = ((0 : (length(signal) - 1)) * fs / length(signal))'; % Compute all possible frequencies of the signal, similar to the spectrogram function.
  % Create a vector mask that is 1 for frequencies lower than the cutoff frequency fc, and 0 for frequencies higher than the cutoff frequency.
  mask = (freq <= cutoff_freq) ;

  ft_of_signal = ft_of_signal .* mask;  % Apply the Hadamard product between the Fourier Transform of the signal and the mask.
  signal = ifft(ft_of_signal);  % Compute the inverse Fourier Transform to get the filtered signal.
  signal = signal / max(abs(signal))  % Normalize the filtered signal.

endfunction