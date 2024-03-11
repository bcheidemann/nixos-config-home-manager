{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "ben";
  home.homeDirectory = "/home/ben";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share";
  };
  home.shellAliases = {
    nv = "nvim";
  };
  home.packages = [
    pkgs.htop
    (pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.libthai        
      ];
    })

    # Applications
    pkgs.spotify

    # Tools
    pkgs.lazygit
  ];

  home.file.".config/hypr" = {
    enable = true;
    source = ./hypr;
    recursive = true;
  };

  programs = {
    bash = {
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
    # VS Code on Wayland has issues, make sure to set the title bar to custom
    # https://github.com/microsoft/vscode/issues/181533
    vscode = {
      enable = true;
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
      userSettings = {
        "window.titleBarStyle" = "custom";
      };
    };
  };
}

