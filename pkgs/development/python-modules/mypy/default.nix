{ stdenv, fetchPypi, buildPythonPackage, lxml, typed-ast, psutil, isPy3k
,mypy_extensions }:

buildPythonPackage rec {
  pname = "mypy";
  version = "0.641";

  # Tests not included in pip package.
  doCheck = false;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ma4l7px96zzb8x89dk9mkrrdzdhdqckvfsbld4fj9n25k1iw1wf";
  };

  disabled = !isPy3k;

  propagatedBuildInputs = [ lxml typed-ast psutil mypy_extensions ];

  meta = with stdenv.lib; {
    description = "Optional static typing for Python";
    homepage    = "http://www.mypy-lang.org";
    license     = licenses.mit;
    maintainers = with maintainers; [ martingms lnl7 ];
  };
}
