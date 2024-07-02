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
    enable = false;
    description = "Disable D3cold for PCI device 0000:01:00.0";
    serviceConfig.Type = "oneshot";
    script = ''
      echo 0 > /sys/bus/pci/devices/0000:01:00.0/d3cold_allowed
    '';
    wantedBy = [ "multi-user.target" ];
  };

  systemd.services.disable-nvme-d3cold = {
    description = "Disable d3cold for NVMe to fix suspend issues";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/echo 0 > /sys/bus/pci/devices/0000:01:00.0/d3cold_allowed";
      RemainAfterExit = true;
    };
  };

  services.logind = {
    lidSwitch = "suspend";
  };

  services.mbpfan = {
    enable = true;
    aggressive = false;
    settings.general = {
        low_temp = 50;
        high_temp = 55;
        max_temp = 65;
    };
  };

  

}
