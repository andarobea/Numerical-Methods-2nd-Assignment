function x = oscillator(freq, fs, dur, A, D, S, R)

  format long
  t = 0 : 1/fs : dur - 1/fs;  % vector de timp

  sine = sin(2 * pi * freq * t);  % funtia sinus

  attack_samples = floor(A * fs); % numarul de samples dupa formula din enunt
  decay_samples = floor(D * fs);
  release_samples = floor(R * fs);
  sustain_samples = ceil(dur * fs) - attack_samples - decay_samples - release_samples;

  attack_envelope = linspace(0, 1, attack_samples); % linear ramps folosind valorile de mai sus
  decay_envelope = linspace(1, S, decay_samples);
  sustain_envelope = S * ones(sustain_samples, 1)';
  release_envelope = linspace(S, 0, release_samples);

  final_envelope = zeros(ceil(dur * fs), 1);  % concatenarea vectorilor anteriori
  final_envelope = [attack_envelope, decay_envelope, sustain_envelope, release_envelope]';

  x = zeros(ceil(dur * fs), 1);
  x = final_envelope .* sine' % valoarea cautata
endfunction

