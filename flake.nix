{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        defaultPackage = pkgs.python3Packages.buildPythonApplication rec {
          pname = "svgsprite";
          version = "0.1.1";
          src = pkgs.python3Packages.fetchPypi {
            inherit pname version;
            sha256 = "sha256-EmMXWFw06k1R6XEId4IC5wqVdw7Rzmh/kgUC+bCBexw=";
          };
        };
        devShell = pkgs.mkShell {
          packages =
            [ (pkgs.python3.withPackages (ps: [ ps.build ps.twine ])) ];
        };
      });
}
