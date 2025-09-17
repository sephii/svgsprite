{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    let
      overlay = (final: prev: { svgsprite = final.python3.pkgs.callPackage ./. { }; });
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };
      in
      {
        packages.default = pkgs.svgsprite;

        devShell = pkgs.mkShell {
          packages = [
            (pkgs.python3.withPackages (ps: [
              ps.build
              ps.twine
            ]))
          ];
        };
      }
    )
    // {
      overlays.default = overlay;
    };
}
