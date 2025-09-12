{
  overlays = {
    default = final: prev: {
      black = prev.black.overrideAttrs (old: {
        propagatedBuildInputs = old.propagatedBuildInputs ++ prev.black.optional-dependencies.jupyter;
      });
    };
  };
}
