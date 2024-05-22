{pkgs, ...}:

{

  programs.micro.enable = true;
  programs.micro.settings = {
    softwrap = true;
    wordwrap = true;
    tabsize = 2;
  };

}
