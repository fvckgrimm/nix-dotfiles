# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./mac-things.nix
      ../../modules/nixos/packages/default.nix
      ../../modules/nixos/hacking/default.nix
      ../../modules/nixos/security/default.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-484ebfa9-d0c5-4606-a04f-2c627a7995cd".device = "/dev/disk/by-uuid/484ebfa9-d0c5-4606-a04f-2c627a7995cd";
  networking.hostName = "desolate"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  boot.kernelParams = [ "button.lid_init_state=open" ];
  powerManagement.enable = true;
  #powerManagement.powerUpCommands = "sudo rmmod atkbd; sudo modprobe atkbd reset=1";
  powerManagement.resumeCommands = "sudo ${pkgs.kmod}/bin/rmmod atkbd; sudo ${pkgs.kmod}/bin/modprobe atkbd reset=1";

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.packages = with pkgs; [ 
    (nerdfonts.override { fonts = [ "JetBrainsMono" "DroidSansMono" "Hack" "FiraCode" "GeistMono" "NerdFontsSymbolsOnly" ]; }) 
    ubuntu_font_family
    liberation_ttf
    fira-code
    fira-code-symbols
    noto-fonts 
    noto-fonts-cjk 
    noto-fonts-emoji 
    dejavu_fonts
    material-symbols
  ];

  fonts.fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = false;
        style = "full";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
      defaultFonts = {
        serif = [ "JetBrainsMono" "Noto Color Emoji"];
        sansSerif = [ "JetBrainsMono" "Noto Color Emoji"];
        monospace = ["GeistMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
    
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Budgie Desktop environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.budgie.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.theme = "catppuccin-sddm-corners";
  #services.xserver.displayManager.sddm = {
  #  enable = true;
  #  theme = "catppuccin-mocha";
  #};

  # Hyprland
  programs.hyprland.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged
    # program here, NOT in environment.systemPackages
  ];

  environment.sessionVariables = {
    #WLR_RENDERER_ALLOW_SOFTWARE = "1";
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  environment.shells = with pkgs; [ bash zsh fish nushell ];
  users.defaultUserShell = pkgs.zsh;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.grimm = {
    isNormalUser = true;
    description = "grimm";
    extraGroups = [ 
    "networkmanager" 
    "wheel" 
    ];
    packages = with pkgs; [
      #firefox
      #thunderbird
    ];
  };


  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   git
   neovim
  ];

  programs.zsh.enable = true;
  services.dbus.enable = true;
  security.polkit.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.mullvad-vpn.enable = true;
  services.opensnitch.enable = true;
  # services.printing.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
