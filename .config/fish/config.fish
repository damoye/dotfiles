if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf --fish | source

starship init fish | source

function vim
  nvim $argv
end
