{lib, ...}: {
  services = {
    getty = {
      autologinUser = "nick";
      helpLine = lib.mkForce "";
    };
  };
}
