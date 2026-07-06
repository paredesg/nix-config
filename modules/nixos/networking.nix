{ ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # Décommenter/ajuster si besoin de ports ouverts
  # networking.firewall.allowedTCPPorts = [ 22 ];
}