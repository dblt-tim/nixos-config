{ pkgs, ... }:

{
  environment.systemPackages = 
    builtins.concatLists [
      (import ./packages/base.nix { inherit pkgs; })
      (import ./packages/dev.nix { inherit pkgs; })
    ];
}
