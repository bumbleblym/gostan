{ mkDerivation, base, lens, stdenv, transformers }:
mkDerivation {
  pname = "gostan";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base lens transformers ];
  homepage = "https://github.com/bumbleblym/gostan";
  description = "gostan your lists";
  license = stdenv.lib.licenses.bsd3;
}
