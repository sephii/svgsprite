{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };
        overlay = (final: prev: { svgsprite = final.callPackage ./. { }; });
      in {
        inherit overlay;

        defaultPackage = pkgs.svgsprite;
        devShell = pkgs.mkShell {
          packages =
            [ (pkgs.python3.withPackages (ps: [ ps.build ps.twine ])) ];
        };
      });
}
