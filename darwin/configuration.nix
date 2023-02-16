{ pkgs, lib, ... }:
{

  services.nix-daemon.enable = true;
  
  programs.zsh.enable = true;
  #nixpkgs.config.allowUnfree = true;
 
  nix = {
    settings = {
      auto-optimise-store = true;
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = [
    pkgs.curl
    pkgs.vim
    pkgs.htop
    pkgs.jq
    pkgs.vscodium
    pkgs.git
    pkgs.gh
    pkgs.rectangle
    pkgs.nushell
    pkgs.awscli2
    pkgs.lastpass-cli
    pkgs.discord
    pkgs.docker-compose
    pkgs.cachix
  ];

  users.users.isabella = {
    name = "Isabella Skorepova";
    home = "/Users/isabella";
  };

  system.stateVersion = 4;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.isabella = {pkgs,...}: {
    home.stateVersion = "22.11";
    programs.git = {
      enable = true;
      lfs.enable = true;
      userEmail = "isabella@skorepova.info";
      userName = "Isabella Skorepova";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    programs.nushell = {
      enable = true;
      envFile.source = ../nushell/env.nu;
      configFile.source = ../nushell/config.nu;
    };

      home.file = lib.optionalAttrs pkgs.stdenv.isDarwin {
        "Library/Application Support/nushell/config.nu".text = ''
          source  ~/.config/nushell/config.nu
        '';
        "Library/Application Support/nushell/env.nu".text = ''
          source  ~/.config/nushell/env.nu
        '';
      };
  };

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      "firefox"
      "telegram"
      "figma"
      "zoom"
    ];
  };
}

