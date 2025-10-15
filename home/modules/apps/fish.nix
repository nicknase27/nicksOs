{pkgs, ...}: let
  myAliases = {
    ls = "ls --color";
    ".." = "cd ..";
    ff = "fastfetch";
    off = "poweroff";
    add = "git add .";
    stat = "git status";
    push = "git push";
  };
in {
  programs.bash = {
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

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = myAliases;
    functions = {
      rebuild = {
        body = "sudo nixos-rebuild switch --flake ~/nicksOs/system/#Theseus";
      };
      swap = {
        body = "home-manager switch --flake ~/nicksOs/home/#nick";
      };
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
}
