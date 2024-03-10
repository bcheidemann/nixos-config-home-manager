{ config, pkgs, ... }:

{
  home.username = "ben";
  home.homeDirectory = "/home/ben";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.shellAliases = {};
  home.packages = [
    pkgs.htop
    (pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.libthai        
      ];
    })
  ];
  home.file = {
    ".bashrc".source = ./dotfiles/.bashrc;
  };

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

