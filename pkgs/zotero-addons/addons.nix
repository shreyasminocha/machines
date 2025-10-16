{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}:
{
  zotero-better-bibtex = {
    pname = "zotero-better-bibtex";
    version = "7.0.50";
    src = fetchurl {
      url = "https://github.com/retorquere/zotero-better-bibtex/releases/download/v7.0.50/zotero-better-bibtex-7.0.50.xpi";
      sha256 = "sha256-KftAvJ7OWSZ3XW6Apo8eaO1get3G55ozNdorZVGN0jw=";
    };
    addonId = "better-bibtex@iris-advies.com";
    license = "mit";
    homepage = "https://github.com/retorquere/zotero-better-bibtex";
    description = "Make Zotero effective for us LaTeX holdouts";
  };
  zotero-reading-list = {
    pname = "zotero-reading-list";
    version = "1.5.14";
    src = fetchurl {
      url = "https://github.com/Dominic-DallOsto/zotero-reading-list/releases/download/v1.5.14/zotero-reading-list.xpi";
      sha256 = "sha256-ackaE5BpiyKJw98qsVdJpKAieogWwjeQ4mS+LSq+Ghg=";
    };
    addonId = "reading-list@hotmail.com";
    license = "gpl3";
    homepage = "https://github.com/Dominic-DallOsto/zotero-reading-list";
    description = "Keep track of whether you've read items in Zotero";
  };
}
