{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    feishin
    mpv
  ];
}
