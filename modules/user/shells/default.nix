{ config, pkgs, lib, attrPairs, ... }:
{
    ### TODO: EVERYTHING
    imports = 
    [
        #./bash/default.nix
        #./zsh/default.nix
    ];

    programs.starship = 
    {
        enable = true;
        presets = 
        [
            "bracketed-segments"
        ];
    };

    programs.zsh.enable = true;

    #shellAliases = {
    #    ls = "ls --color";
    #    #.. = "cd ..";
    #    vim = "neovim";
    #    ff = "fastfetch";
    #    off = "poweroff";
    #    push = "git push -u origin main";
    #    add = "git add .";
    #};

    #functions = {
    #    shrc = ''
    #        case "$SHELL" in
    #        */zsh) nvim "$HOME/.zshrc" ;;
    #        */bash) nvim "$HOME/.bashrc" ;;
    #        */fish) nvim "$HOME/.config/fish/config.fish" ;;
    #        *) nvim "$HOME/.profile" ;;
    #    esac
    #    '';
    #    hyprcfg = ''
    #        nvim "$(find "$HOME/.config/hypr" -type f,l | sed "s|$HOME/.config/hypr/||" | fzf | xargs -I{} echo "$HOME/.config/hypr/{}")"
    #    '';
    #    barcfg = ''
    #        nvim "$(find -L "$HOME/.config/waybar" -type f | sed "s|$HOME/.config/waybar/||" | fzf | xargs -I{} echo "$HOME/.config/waybar/{}")"
    #    '';
    #};
}