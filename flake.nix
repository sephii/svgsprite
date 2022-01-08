{
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell.${system} = pkgs.mkShell {
        packages = [ (pkgs.python3.withPackages (ps: [ ps.build ps.twine ])) ];
      };
    };
}
