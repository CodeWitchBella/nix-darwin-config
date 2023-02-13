{ pkgs, ... }:
{

  services.nix-daemon.enable = true;
  
  programs.zsh.enable = true;
  #nixpkgs.config.allowUnfree = true;
 
  nix = {
    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
  
  environment.systemPackages = [
    pkgs.curl
    pkgs.vim
    pkgs.htop
    pkgs.jq
    pkgs.vscodium
  ];

  users.users.isabella = {
    name = "Isabella Skorepova";
    home = "/Users/isabella";
  };

  system.stateVersion = 4;
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
  };
}

