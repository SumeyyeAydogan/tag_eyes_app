import 'image_constants.dart';

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

  String toJpg(String name) => 'assets/images/$name.jpg';
  String toJpeg(String name) => 'assets/images/$name.jpeg';
}
