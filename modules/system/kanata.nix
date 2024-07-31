{ inputs, outputs, config, lib, pkgs, ... }:


{
  environment.systemPackages = with pkgs; [
    kanata
  ];

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          #"/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:2.4.3:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:2.4.3:1.1-event"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:2.4.3:1.2-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
          caps a s d f j k l ;
          )
          (defvar
          tap-time 100
          hold-time 300
          )
          (defalias
          caps (tap-hold 100 250 esc lctl)
          a (tap-hold $tap-time $hold-time a lmet)
          s (tap-hold $tap-time $hold-time s lalt)
          d (tap-hold $tap-time $hold-time d lsft)
          f (tap-hold $tap-time $hold-time f lctl)
          j (tap-hold $tap-time $hold-time j rctl)
          k (tap-hold $tap-time $hold-time k rsft)
          l (tap-hold $tap-time $hold-time l ralt)
          ; (tap-hold $tap-time $hold-time ; rmet)
          )

          (deflayer base
          @caps @a  @s  @d  @f  @j  @k  @l  @;
          )
        '';
      };
    };
  };
}
