{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/fastfetch.nix
    ./modules/kitty.nix
    ./modules/fonts.nix
    ./modules/hyprland.nix
  ];

  home.username = "highv";
  home.homeDirectory = "/home/highv";

  home.stateVersion = "24.05";

  home.sessionVariables = {
    BROWSER = "brave";
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;
}
