# https://nixos.wiki/wiki/Packaging/Binaries
{ lib, stdenv, fetchurl, autoPatchelfHook, systemd }:
let
  inherit (stdenv.hostPlatform) system;
  pname = "velociraptor";
  version = "0.6.4-1";
  appname = "velociraptor";
  meta = with lib; {
    homepage = "https://docs.velociraptor.app/";
    description = "Velociraptor";
    license = licenses.mit;
  };

  filename = if stdenv.isDarwin then "velociraptor-v${version}-darwin-amd64" else "velociraptor-v${version}-linux-amd64";
  src = fetchurl {
    url = "https://github.com/Velocidex/velociraptor/releases/download/v0.6.4-1/${filename}";
    sha256 = if stdenv.isDarwin then "" else "sha256-Oh8fvqSjFukWCE17zJ2B/d4OlFJ5Dy+D3QIIZw4Ez7A=";
  };

  linux = stdenv.mkDerivation {
    inherit pname version src filename;
    buildInputs = [ systemd ];

    dontUnpack = true;

    nativeBuiltInputs = [
      autoPatchelfHook
    ];
    
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/${filename}
    '';

    postFixup = ''
      patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/${filename}
      
      chmod +x $out/bin/${filename}
    '';  
  };

  darwin = stdenv.mkDerivation {
    inherit pname version src filename;
    meta = meta // { platforms = [ "x86_64-darwin" "aarch64-darwin" ]; };
    buildInputs = [ systemd ];

    dontUnpack = true;

    nativeBuiltInputs = [
      autoPatchelfHook
    ];
    
    installPhase = ''
      mkdir -p $out/Applications
      cp $src $out/Applications/${filename}
    '';

    postFixup = ''
      patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/Applications/${filename}
      
      chmod +x $out/Applications/${filename}
    '';  
  };
in
if stdenv.isDarwin then darwin else linux