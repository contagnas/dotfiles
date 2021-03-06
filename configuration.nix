# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Supposedly better for SSD
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.plymouth.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;

      packageOverrides = pkgs: {
        i3Support = true;
      };
    };
  };

  time.timeZone = "America/Chicago";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget

    vim
    emacs

    discord
    google-chrome
    chromium
    steam

    xbindkeys
    xdotool
    scrot
    xclip

    openjdk
    git
    ammonite
    sbt

    polybar
    siji
    unifont
    rofi
    nitrogen
  ];


  users.users.chills = {
    extraGroups = [ "wheel" "networkmanager" ];
    isNormalUser = true;
    name="chills";
    home = "/home/chills";
  };

  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "kbmfpngjjgdllneeigpgjifpgocmfgmb" # res
  ];

  services.openssh.enable = true;

  services.emacs.enable = true;

  sound = {
    enable = true;
    # mediaKeys.enable = true; # Doesn't work, might have to be user-level :(

    # config for alsa, default didn't work
    # see https://github.com/NixOS/nixpkgs/issues/5755
  };

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
    extraConfig = ''
      load-module module-switch-on-connect
    '';
  };

  hardware.opengl.driSupport32Bit = true;

  services.xserver = {
    enable = true;
    layout = "us";

    # swap caps and escape
    xkbOptions = "caps:escape";

    # repeat keys faster
    autoRepeatDelay = 200;
    autoRepeatInterval = 25;

    # Touchpad support
    libinput = {
      enable = true;
      naturalScrolling = true;
      accelProfile = "flat";
    };

    # No acceleration for zowie mouse
    #config = ''
      #Section "InputClass"
        #Identifier     "Kingsis Peripherals ZOWIE Gaming mouse"
        #Driver         "libinput"
        #MatchIsPointer "on"
        #Option         "AccelProfile" "flat"
    #'';

    windowManager = {
      exwm = {
        enable = true;
        # package = pkgs.i3-gaps;
      };
      default = "exwm";
    };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
}
