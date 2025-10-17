{...}: {
  programs = {
    qutebrowser = {
      enable = true;
      loadAutoconfig = false;
      searchEngines = {
        DEFAULT = "https://duckduckgo.com/?q={}";
        nixw = "https://nixos.wiki/index.php?title=Special:Search&search={}";
        nixops = "https://search.nixos.org/options?channel=25.05&query={}";
        hops = "https://home-manager-options.extranix.com/?query={}&release=release-25.05";
        yt = "https://www.youtube.com/results?search_query={}";
      };
      settings = {
        content = {
          webgl = false;
          canvas_reading = false;
          geolocation = false;
          webrtc_ip_handling_policy = "default-public-interface-only";
          cookies = {
            accept = "all";
            store = true;
          };
          blocking = {
            enabled = true;
            method = "adblock";
            adblock = {
              lists = [
                "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts"
              ];
            };
          };
          user_stylesheets = [
            "~/.config/qutebrowser/youtube.css"
          ];
        };
        colors = {
          webpage = {
            darkmode = {
              enabled = true;
              algorithm = "lightness-cielab";
              policy = {
                images = "never";
              };
            };
          };
        };
        tabs = {
          title = {
            format = "{audio}{current_title}";
          };
          width = "7%";
        };
        auto_save = {
          session = true;
        };
        scrolling = {
          smooth = true;
        };
      };
      keyBindings = {
        normal = {
          "<Ctrl-1>" = "tab-focus 1";
          "<Ctrl-2>" = "tab-focus 2";
          "<Ctrl-3>" = "tab-focus 3";
          "<Ctrl-4>" = "tab-focus 4";
          "<Ctrl-5>" = "tab-focus 5";
          "<Ctrl-6>" = "tab-focus 6";
          "<Ctrl-7>" = "tab-focus 7";
          "<Ctrl-8>" = "tab-focus 8";
          "<Ctrl-9>" = "tab-focus 9";
        };
      };
      extraConfig = ''
        c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
      '';
    };
  };
}
