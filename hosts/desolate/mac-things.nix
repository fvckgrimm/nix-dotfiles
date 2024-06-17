{config, pkgs, ...}:

{

  # IDK If these things work yet fr, but fuck it we ball

  hardware.facetimehd.enable = true;


  services.logind.extraConfig = ''
    HandlePowerKey=suspend-then-hibernate
    HandlePowerKeyLongPress=poweroff
    HandleLidSwitch=suspend-then-hibernate
    HandleLidSwitchExternalPower=suspend-then-hibernate
    HandleLidSwitchDocked=suspend-then-hibernate
    HoldoffTimeoutSec=5s
    IdleAction=suspend
    IdleActionSec=300s
  '';

  # Potential fix to mac not resuming on wake up 
  systemd.services.disable-d3cold = {
    enable = true;
    description = "Disable D3cold for PCI device 0000:01:00.0";
    serviceConfig.Type = "oneshot";
    script = ''
      echo 0 > /sys/bus/pci/devices/0000:01:00.0/d3cold_allowed
    '';
    wantedBy = [ "multi-user.target" ];
  };

  services.mbpfan = {
    enable = true;
    aggressive = true;
  };

  

}
