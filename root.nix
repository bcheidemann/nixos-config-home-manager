args@{ config, pkgs, ... }:

{
  imports = [
    (import ./common.nix (args // {
      opts = {
        username = "root";
        homeDir = "/root";
      };
    }))
  ];
}

