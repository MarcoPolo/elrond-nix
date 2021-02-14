{ lib, python3, python3Packages }:

python3.pkgs.buildPythonApplication rec {
  pname = "erdpy";
  version = "1.0.9";

  src = python3.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "sha256-KI7m0geNKXL7pm98c+2gWi9CSpr5hr7tuQoNjvaCrF0=";
  };

  postPatch = ''
    # don't test bash builtins
    # rm testing/test_argcomplete.py
  '';

  checkInputs = [ ];
  propagatedBuildInputs = with python3.pkgs; [ setuptools pynacl pycryptodomex prettytable bottle toml requests cryptography ];

  meta = with lib; {
    maintainers = [ ];
    description = "Erdpy";
  };
}
