{ lib
, stdenv
, fetchFromGitHub
, unzip
}:
stdenv.mkDerivation rec {
  pname = "sf-mono-powerline";
  version = "16.0d1e1";

  src = fetchFromGitHub {
    owner = "Twixes";
    repo = "SF-Mono-Powerline";
    rev = "master";
    hash = "sha256-8t205f/j+c4YqQUxNX0olxr5t2wLbv25T/aV/EwlQjE=";
  };

  nativeBuildInputs = [unzip];

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp *.otf $out/share/fonts/opentype
  '';

  meta = with lib; {
    description = "Apple's SF Mono font patched for Powerline support";
    homepage = "https://github.com/Twixes/SF-Mono-Powerline";
    license = licenses.mit;
    maintainers = with maintainers; [ Twixes ];
  };
}
