function ls --wraps='exa -la' --wraps='exa -la -s=type' --description 'alias ls=exa -la -s=type'
  exa -la -s=type $argv; 
end
