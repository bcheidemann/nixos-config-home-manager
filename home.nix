args@{ config, pkgs, ... }:

{
  imports = [
    (import ./common.nix (args // {
      username = "ben";
      homeDir = "/home/ben";
    }))
  ];
}

