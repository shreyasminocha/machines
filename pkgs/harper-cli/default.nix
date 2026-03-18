{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
  versionCheckHook,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "harper";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Automattic";
    repo = "harper";
    rev = "v1.9.0";
    # rev = "v${finalAttrs.version}";
    hash = "sha256-cmuusPSIRUPbpakSpLHjvDoBvp8ERkGimxsGpZnhC5o=";
  };

  buildAndTestSubdir = "harper-cli";

  cargoHash = "sha256-stp/FYJBBG7wFUwAS/I8KWk4E9VqWAYnnp7IR0YavPM=";

  passthru.updateScript = nix-update-script { };

  nativeInstallCheckInputs = [
    versionCheckHook
  ];
  doInstallCheck = true;

  meta = {
    description = "Grammar Checker for Developers";
    homepage = "https://github.com/Automattic/harper";
    changelog = "https://github.com/Automattic/harper/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      shreyasminocha
    ];
    mainProgram = "harper-cli";
  };
})
