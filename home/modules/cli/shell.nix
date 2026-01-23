{
  config,
  pkgs,
  lib,
  hostname,
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
      shellInit = ''
                if test "$TERM" = "xterm-kitty"
            function ssh
                TERM=xterm-256color command ssh $argv
            end
        end


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
        rebuild = {
          body = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nicksOs/system/#${hostname}";
        };
        swap = {
          body = "home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake ${config.home.homeDirectory}/nicksOs/home/#nick@${hostname}";
        };
        nixcf = {
          body = ''nvim (find -L "${config.home.homeDirectory}/nicksOs" -type f -not -path "*/.git/*" -o -path "${config.home.homeDirectory}/nicksOs/.git/config" | sed "s|${config.home.homeDirectory}/nicksOs/||" | fzf --layout=reverse --height=60% --preview "bat -p --color=always ${config.home.homeDirectory}/nicksOs/{}" | xargs -I{} echo "${config.home.homeDirectory}/nicksOs/{}")'';
        };
        vimcf = {
          body = ''nvim (find -L "${config.home.homeDirectory}/.config/nvim" -type f | sed "s|${config.home.homeDirectory}/.config/nvim/||" | fzf --layout=reverse --height=60% --preview "bat -p --color=always ${config.home.homeDirectory}/.config/nvim/{}" | xargs -I{} echo "${config.home.homeDirectory}/.config/nvim/{}")'';
        };
        sa = {
          body = ''
            set hosts "Theseus" "Hermes" "Apollo" "Iris"
            for host in $hosts
              echo "Syncing to $host..."
              rsync -a -q --delete --progress ${config.home.homeDirectory}/nicksOs/ $host:${config.home.homeDirectory}/nicksOs/
            end
          '';
        };
        so = {
          body = ''
            set host $argv[1]
              echo "Syncing to $host..."
              rsync -a -q --delete --progress --rsh=ssh ${config.home.homeDirectory}/nicksOs/ $host:${config.home.homeDirectory}/nicksOs/
          '';
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
