{
  lib,
  pkgs,
  fetchFromGitHub,
}:
let
  version = "0.26.2";
in
pkgs.poetry2nix.mkPoetryApplication {
  overrides = pkgs.poetry2nix.overrides.withDefaults (
    final: prev: {
      python = pkgs.python313;
      # "PySide6" = pkgs.python313Packages.pyside6;
      mpegdash = prev.mpegdash.overridePythonAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ final.setuptools ];
      });
      "python-ffmpeg" = prev."python-ffmpeg".overridePythonAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ final.setuptools ];
      });
      "mypy-extensions" = prev."mypy-extensions".overridePythonAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ final."flit-core" ];
      });

      pathvalidate = final.buildPythonPackage rec {
        pname = "pathvalidate";
        version = "3.3.1";

        src = pkgs.fetchPypi {
          inherit pname version;
          sha256 = "sha256-sYwHISv+rWJDRbuOHWFBzc8Vo5c2mU6guUA1rSsboXc=";
        };

        nativeBuildInputs = [ pkgs.python313Packages.setuptools-scm ];

        doCheck = false;
        format = "pyproject";
      };
    }
  );

  extras = [ ];
  checkGroups = [ ];

  projectDir = pkgs.stdenv.mkDerivation {
    name = "tidal_dl_ng";

    src = fetchFromGitHub {
      owner = "exislow";
      repo = "tidal-dl-ng";
      rev = "v${version}";
      sha256 = "sha256-9C7IpLKeR08/nMbePltwGrzIgXfdaVfyOeFQnfCwMKg=";
    };

    phases = [
      "unpackPhase"
      "patchPhase"
      "installPhase"
    ];

    patchPhase = ''
      # add missing `name` and `version` fields under `tool.poetry`
      sed -zE --in-place 's/(\[tool.poetry\])\n/\1\nname = "tidal-dl-ng"\nversion = "${version}"\n/g' pyproject.toml
    '';

    installPhase = ''
      cp -r . $out
    '';
  };

  meta = {
    description = "Multithreaded TIDAL Media Downloader Next Generation";
    mainProgram = "tidal-dl-ng";
    homepage = "https://github.com/exislow/tidal-dl-ng";
    license = lib.licenses.agpl3Only;
  };
}
