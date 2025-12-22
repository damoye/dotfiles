if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf --fish | source

starship init fish | source

pay-respects fish --alias | source

function vim
  nvim $argv
end
