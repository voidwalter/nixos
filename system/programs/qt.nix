{ pkgs, ... }: {
  qt = {
    enable = true;
    style = "kvantum";
    platformTheme = "qt5ct";
  };

  environment.systemPackages = with pkgs.qt6Packages; [
    qt6ct
    qtbase
    qtwayland
    qttools
    qtdeclarative
    qtwebengine
    qtmultimedia
    qtquick3d
    qt5compat
    qtsvg
    wrapQtAppsHook
  ];
}
