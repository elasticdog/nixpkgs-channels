{ stdenv, fetchurl, perl }:

stdenv.mkDerivation rec {
  name = "gnused-${version}";
  version = "4.5";

  src = fetchurl {
    url = "mirror://gnu/sed/sed-${version}.tar.xz";
    sha256 = "0h3b2jfj57wmz680vkbyavlsrkak556qhvs7m7fdlawwhg477bbs";
  };

  outputs = [ "out" "info" ];

  nativeBuildInputs = [ perl ];
  preConfigure = "patchShebangs ./build-aux/help2man";

  # Prevents attempts of running 'help2man' on cross-built binaries.
  PERL = if stdenv.hostPlatform == stdenv.buildPlatform then null else "missing";

  meta = {
    homepage = http://www.gnu.org/software/sed/;
    description = "GNU sed, a batch stream editor";

    longDescription = ''
      Sed (stream editor) isn't really a true text editor or text
      processor.  Instead, it is used to filter text, i.e., it takes
      text input and performs some operation (or set of operations) on
      it and outputs the modified text.  Sed is typically used for
      extracting part of a file using pattern matching or substituting
      multiple occurrences of a string within a file.
    '';

    license = stdenv.lib.licenses.gpl3Plus;

    platforms = stdenv.lib.platforms.unix;
    maintainers = [ ];
  };
}
