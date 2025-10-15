{pkgs, ...}: let
  myAliases = {
    ls = "ls --color";
    ".." = "cd ..";
    ff = "fastfetch";
    off = "poweroff";
    add = "git add .";
    stat = "git status";
    push = "git push";
    commit = "git commit -m";
    unstow = "stow -D";
  };
in {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
      shellAliases = myAliases;
      functions = {
        nixcf = {
          body = ''nvim (find -L "$HOME/nicksOs" -type f -not -path "*/.git/*" -o -path "$HOME/nicksOs/.git/config" | sed "s|$HOME/nicksOs/||" | fzf | xargs -I{} echo "$HOME/nicksOs/{}")        '';
        };
        hyprcf = {
          body = ''
            nvim (find -L "$HOME/.config/hypr" -type f | sed "s|$HOME/.config/hypr/||" | fzf | xargs -I{} echo "$HOME/.config/hypr/{}")
          '';
        };
        barcf = {
          body = ''
            nvim (find -L "$HOME/.config/waybar" -type f | sed "s|$HOME/.config/waybar/||" | fzf | xargs -I{} echo "$HOME/.config/waybar/{}")
          '';
        };
      };
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        username = {
          show_always = true;
        };
        hostname = {
          ssh_only = false;
        };
        custom.userhost = {
          description = "Combined username and hostname";
          command = "echo \"$(whoami)@$(hostname)\"";
          when = true; # Always run
          format = "[$output]($style) ";
        };
        add_newline = true; # Matches preset
        format = "$custom$directory$git_branch$git_status$character";
      };
    };

    bash = {
      enable = true;
      shellAliases = myAliases;
      initExtra = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };
}
