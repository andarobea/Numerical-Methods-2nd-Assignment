function signal = apply_reverb(signal, impulse_response)

  impulse_response = stereo_to_mono(impulse_response);  % Make sure that the impulse response is in mono by using stereo_to_mono.
  signal = fftconv(signal, impulse_response); % Compute the convolution between the signal and the impulse response. 
  signal = signal / max(abs(signal)); % Normalize the resulting signal.
endfunction

