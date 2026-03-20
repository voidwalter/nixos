{ config, lib, ... }:

{
  programs.nixvim = {
    plugins.noice = {
      enable = true;
    };
  };
}
