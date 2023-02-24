{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    neovim
    alacritty
    wofi
    polybar
    waybar
    mlocate
    deluge


    numix-gtk-theme
    numix-cursor-theme
    numix-icon-theme
    dunst
    swaynotificationcenter
    pavucontrol
    starship
    networkmanagerapplet
    pulseaudio

    libsForQt5.qt5.qtgraphicaleffects
    gnome.gnome-tweaks

    grim
    slurp
    wl-clipboard

    git
    python311
    lapce

    wayland
    rustup
    rust-analyzer
    cmake
    lua
    luajit
    ninja
    julia
    nixfmt
    clang
    clang-tools
    pkg-config
    clangStdenv
    yarn
    nodejs
  ];

  fonts.fonts = with pkgs; [
    font-awesome
    (nerdfonts.override { fonts = [ "Hack" ];})
  ];

  programs = {
    light.enable = true;
    zsh.enable =true;
  };
  
  services = {
    fwupd.enable = true;

    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        RUNTIME_PM_DENYLIST = "08:00.0";
      };
    };
  };
}
