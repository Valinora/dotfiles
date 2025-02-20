set fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/valinora/.opam/opam-init/init.fish' && source '/home/valinora/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration


# Generate bun completions, if the file doesn't exist.
if not test -e ~/.config/fish/completions/bun.fish;
    if type -q 'bun';
        bun completions
    end
end
