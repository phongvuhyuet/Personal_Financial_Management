class Assets {
  static const String assetsURL = "assets/";

  static const String fonts = "$assetsURL/fonts/";
  static const String images = "$assetsURL/images/";
  static const String icons = "$assetsURL/icons/";
}

class ToggleIcon {
  //URL to the icon though the assets folder
  static const String toggleIconURL = "${Assets.icons}/toggle";

  static const String on = "$toggleIconURL/on.png";
  static const String off = "$toggleIconURL/off.png";
  //... more icons follow this design
}
