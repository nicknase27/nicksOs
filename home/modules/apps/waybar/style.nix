{...}: {
  programs.waybar = {
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 15px;
        font-weight: bold;
        border-radius: 5px;
      }

      window#waybar {
        background-color: #18181b;
        color: #ffffff;
        border-radius: 10px;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #window {
        margin: 5px;
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
        transition: 0.3s ease-in-out;
      }

      button:hover {
        background: inherit;
      }

      #workspaces {
        margin: 5px;
        background-color: #27272a;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #ffffff;
        border-radius: 5px;
        transition: 0.3s ease-in-out;
      }

      #workspaces button:hover {
        background: #3f3f46;
      }

      #workspaces button.focused {
        background-color: #64727d;
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.active {
        background-color: #FF670D;
        color: #000;
      }

      #workspaces button.empty {
        color: #777;
      }

      #workspaces button.empty.active {
        background-color: #ef4444;
        color: #000;
      }

      #mode {
        background-color: #64727d;
        box-shadow: inset 0 -3px #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #network,
      #pulseaudio,
      #mode,
      #power-profiles-daemon,
      #tray,
      #bluetooth,
      #custom-power {
        padding: 0 14px;
        color: #ffffff;
        margin: 5px 5px 5px 0;
      }

      #tray {
        background-color: #3f3f46;
      }

      #clock {
        background-color: #3f3f46;
      }

      #battery {
        background-color: #ffffff;
        color: #27272a;
      }

      #battery.charging,
      #battery.plugged {
        color: #ffffff;
        background-color: #27272a;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }

      #power-profiles-daemon.performance {
        background-color: #ef4444;
        color: #000;
      }

      #power-profiles-daemon.balanced {
        background-color: #3b82f6;
        color: #000;
      }

      #power-profiles-daemon.power-saver {
        background-color: #22c55e;
        color: #000;
      }

      label:focus {
        background-color: #000000;
      }

      #cpu {
        background-color: #18181B;
        color: #ffffff;
      }

      #cpu.critical {
        color: #EF4444;
      }

      #cpu.warning {
        color: #FF670D;
      }

      #memory {
        background-color: #18181B;
      }

      #memory.critical {
        color: #EF4444;
      }

      #memory.warning {
        color: #FF670D;
      }

      #disk {
        background-color: #964b00;
      }

      #network.disconnected {
        background-color: #f43f5e;
        color: #000;
      }

      #bluetooth {
        background-color: #27272a;
      }

      #bluetooth.disabled {
        background-color: #f43f5e;
        color: #000;
      }

      #pulseaudio {
        background-color: #27272a;
      }

      #pulseaudio.muted {
        background-color: #f43f5e;
        color: #000;
      }

      #temperature {
        background-color: #f0932b;
      }

      #temperature.critical {
        background-color: #eb4d4b;
      }

      #custom-power {
        background-color: #ef4444;
        color: #000;
      }

      #custom-media {
        color: #cdd6f4;
        padding: 0 10px;
      }
    '';
  };
}
