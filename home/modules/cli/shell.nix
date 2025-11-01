{
  config,
  pkgs,
  lib,
  ...
}: let
  myAliases = {
    ls = "eza";
    tree = "eza -T";
    ".." = "cd ..";
    ff = "fastfetch";
    off = "poweroff";
    add = "git add .";
    stat = "git status";
    push = "git push";
    pull = "git pull";
    commit = "git commit -m";
    unstow = "stow -D";
    vim = "nvim";
    cat = "bat -pp";
  };
in {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
      shellAliases = myAliases;
      shellAbbrs = {
        "-h" = {
          position = "anywhere";
          expansion = "-h | bat -plhelp";
        };
        "--help" = {
          position = "anywhere";
          expansion = "--help | bat -plhelp";
        };
      };
      functions = {
        nixcf = {
          body = ''nvim (find -L "$HOME/nicksOs" -type f -not -path "*/.git/*" -o -path "$HOME/nicksOs/.git/config" | sed "s|$HOME/nicksOs/||" | fzf --layout=reverse --height=60% --preview "bat -p --color=always $HOME/nicksOs/{}" | xargs -I{} echo "$HOME/nicksOs/{}")'';
        };
        vimcf = {
          body = ''nvim (find -L "$HOME/.config/nvim" -type f | sed "s|$HOME/.config/nvim/||" | fzf --layout=reverse --height=60% --preview "bat -p --color=always $HOME/.config/nvim/{}" | xargs -I{} echo "$HOME/.config/nvim/{}")'';
        };
      };
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = false;
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
      initExtra = lib.mkBefore ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };
}
