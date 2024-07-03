{ lib, stdenv, fetchFromGitHub, kernel, linuxPackages }:

stdenv.mkDerivation rec {
  pname = "macbook12-bluetooth";
  version = "latest";

  src = fetchFromGitHub {
    owner = "leifliddy";
    repo = "macbook12-bluetooth-driver";
    rev = "master";
    sha256 = lib.fakeSha256;
  };

  nativeBuildInputs = [ kernel ];

  buildInputs = [ linuxPackages.buildPackages.patchelf ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}/extra
    cp -v btusb.ko $out/lib/modules/${kernel.modDirVersion}/extra/
  '';

  meta = with lib; {
    description = "Bluetooth driver for MacBook12";
    homepage = "https://github.com/leifliddy/macbook12-bluetooth-driver";
    license = licenses.gpl2;
    maintainers = with maintainers; [ ];
  };
}

