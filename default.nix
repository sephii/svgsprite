{ python3Packages }:
python3Packages.buildPythonApplication rec {
  pname = "svgsprite";
  version = "0.1.1";
  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-EmMXWFw06k1R6XEId4IC5wqVdw7Rzmh/kgUC+bCBexw=";
  };
}
