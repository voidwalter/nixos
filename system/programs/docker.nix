{ config, pkgs, ... }: {
  virtualisation.docker.enable = true;
  users.users.sai.extraGroups = [ "docker" ];
}
