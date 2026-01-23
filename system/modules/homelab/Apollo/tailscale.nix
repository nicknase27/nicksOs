{pkgs, lib, ... }:
{
  services.tailscale = {
  enable = true;
  useRoutingFeatures = "both";
};
}
