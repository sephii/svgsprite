{ python, setuptools }:
python.pkgs.buildPythonApplication rec {
  pname = "svgsprite";
  version = "0.1.1";
  src = python.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "sha256-EmMXWFw06k1R6XEId4IC5wqVdw7Rzmh/kgUC+bCBexw=";
  };

  pyproject = true;

  build-system = [ setuptools ];
}
