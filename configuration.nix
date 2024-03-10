{ config, pkgs, ... }:

{
  home.username = "ben";
  home.homeDirectory = "/home/ben";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.shellAliases = {
    nv = "nvim";
  };
  home.packages = [
    pkgs.htop
  ];

  programs = {
    home-manager = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
    google-chrome = {
      enable = true;
    };
    firefox = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "Ben Heidemann";
      userEmail = "ben@heidemann.dev";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
