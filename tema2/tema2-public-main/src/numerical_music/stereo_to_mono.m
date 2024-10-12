function mono = stereo_to_mono(stereo)
  % mono = stereo;
  % formula din enunt face media aritmetica pe fiecare rand
  mono = mean(stereo,2);  % calculez media aritmetica: mono(i) este media pe randul i din stereo
  % Normalize
  mono = mono / max(abs(mono));
endfunction

