{ lib, 
  rustPlatform, 
  fetchFromGitHub 
}:

rustPlatform.buildRustPackage rec {
  pname = "angry-oxide";
  version = "0.8.13"; 

  src = fetchFromGitHub {
    owner = "Ragnt";
    repo = "AngryOxide";
    rev = "56742ae63fd35e1d8da6283336ed8dd68cb4f6b7"; # You might want to use a specific commit or tag instead
    sha256 = "1p2af8av31w1i1353vdwkv0rfl47v2i03p3wycsq22svi3py2zzc"; # Leave this empty for now
  };

  cargoSha256 = "sha256-pT5mQDpxV+LhWFKQd87HI8MZ7qPenHB3z8lGN2EB65g="; # Leave this empty for now

  meta = with lib; {
    description = "A 802.11 Attack tool built in Rust 🦀 !";
    homepage = "https://github.com/Ragnt/AngryOxide";
    license = licenses.gpl3; # Make sure this is the correct license
    maintainers = [ maintainers.Grimm ]; # Replace with your maintainer name
  };
}
