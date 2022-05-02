class Assets {
  static const String fonts = "fonts";
  static const String images = "images";
  static const String icons = "icons";
}

class ToggleIcon {
  //URL to the icon though the assets folder
  static const String toggleIconURL = "${Assets.icons}/toggle";

  static const String checkboxOff = "$toggleIconURL/indeterminate_checkbox.svg";
  static const String off = "$toggleIconURL/checkbox.svg";
  //... more icons follow this design
}
