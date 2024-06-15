{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    wasabiwallet
    monero-gui
    # xmrig
<<<<<<< HEAD
    #exodus
=======
    exodus
>>>>>>> df95a740e007c03e6bbbc961ebbb99cc5a74d610
  ];

}
