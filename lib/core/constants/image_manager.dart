class ImageManager {
  static ImageManager? _instance;
  static ImageManager get instance => _instance ??= ImageManager._init();
  ImageManager._init();
  String get loginBg => toJpeg(ImageConstants.LOGIN_BG);
  String get profilePhoto => toJpeg(ImageConstants.PROFILE_PHOTO);
  String get turkishDelight => toJpg(ImageConstants.TURKISH_DELIGHT);
  String get turkishBaklava => toJpg(ImageConstants.TURKISH_BAKLAVA);
  String get turkishCottonCandy => toJpg(ImageConstants.TURKISH_COTTON_CANDY);
  String get turkishColdBaklava => toJpg(ImageConstants.TURKISH_COLD_BAKLAVA);
  String get turkishLiraIcon => toPng(ImageConstants.TURKISH_LIRA_ICON);
  String get dollarIcon => toPng(ImageConstants.DOLLAR_ICON);
  String get euroIcon => toPng(ImageConstants.EURO_ICON);
  String get poundIcon => toPng(ImageConstants.POUND_ICON);

  String toPng(String name) => 'assets/images/$name.png';
  String toJpg(String name) => 'assets/images/$name.jpg';
  String toJpeg(String name) => 'assets/images/$name.jpeg';
}
// ignore_for_file: constant_identifier_names

class ImageConstants {
  static const String LOGIN_BG = "login";
  static const String PROFILE_PHOTO = "profile";
  static const String TURKISH_DELIGHT = "turkish-delight";
  static const String TURKISH_BAKLAVA = "turkish-baklava";
  static const String TURKISH_COTTON_CANDY = "turkish-cotton-candy";
  static const String TURKISH_COLD_BAKLAVA = "cold-baklava";
  static const String TURKISH_LIRA_ICON = "turkish-lira-icon";
  static const String DOLLAR_ICON = "dollar-icon";
  static const String EURO_ICON = "euro-icon";
  static const String POUND_ICON = "pound-icon";
}
