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

    # Applications
    pkgs.spotify
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
    # VS Code on Wayland has issues, make sure to set the title bar to custom
    # https://github.com/microsoft/vscode/issues/181533
    vscode = {
      enable = true;
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
      userSettings = {
        "window.titleBarStyle" = "custom";
        "editor.fontFamily" = "'M+1Code Nerd Font','Droid Sans Mono', 'monospace', monospace";
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = false;
          "markdown" = true;
          "scminput" = false;
        };
      };
    };
  };
}

