{ config, pkgs, opts, ... }:

{
  programs.home-manager.enable = true;

  home.username = opts.username;
  home.homeDirectory = opts.homeDir;
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share";
  };
  home.shellAliases = {
    nv = "nvim";
    lg = "lazygit";
    z  = "zellij";
  };
  home.packages = [
    pkgs.bat
    pkgs.htop
    (pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.libthai        
      ];
    })

    # Applications
    pkgs.whatsapp-for-linux
    pkgs.libreoffice
    pkgs.pika-backup
    pkgs.spotify
    (pkgs.appimageTools.wrapType2 {
      name = "warp";
      src = pkgs.fetchurl {
        url = "https://releases.warp.dev/stable/v0.2024.03.05.08.02.stable_01/Warp-x86_64.AppImage";
        hash = "sha256-Ku8Wx5sA/98w/3bQPhcxfwAh52mSzc9mufusQo0Cv0E=";
      };
      extraPkgs = pkgs: with pkgs; [ ];
    })

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
        credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
        core.excludesfile = "/home/ben/.config/home-manager/.dotfiles/.gitignore";
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

