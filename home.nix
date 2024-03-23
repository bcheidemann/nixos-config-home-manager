args@{ config, pkgs, ... }:

{
  imports = [
    (import ./common.nix (args // {
      opts = {
        username = "ben";
        homeDir = "/home/ben";
      };
    }))
  ];
}

