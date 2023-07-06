pkgs: with pkgs; [

  # Go development
  gopls
  godef
  gotools

  # For oflist. Might be time to rewrite this thing
  #python2

  # These paths are actually /etc/nixos/pkgs
  ( import ./pkgs/dotbot.nix )
  ( import ./pkgs/git-caddy.nix )
  ( import ./pkgs/findfile.nix )

]
