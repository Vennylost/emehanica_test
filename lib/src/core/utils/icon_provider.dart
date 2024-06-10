enum IconProvider {
  // Каждый элемент перечисления представляет иконку для определенных погодных условий
  clearSky(imageName: '01d.svg'), // ясно
  fewClouds(imageName: '02d.svg'), // небольшая облачность
  scatteredClouds(imageName: '03d.svg'), // рассеянные облака
  brokenClouds(imageName: '04d.svg'), // облачно с прояснениями
  showerRain(imageName: '09d.svg'), // ливень
  rain(imageName: '10d.svg'), // дождь
  thunderstorm(imageName: '11d.svg'), // гроза
  snow(imageName: '13d.svg'), // снег
  mist(imageName: '50d.svg'); // туман

  const IconProvider({
    required this.imageName,
  });

  final String imageName;
  static const _iconFolderPath = 'assets/icons';

  // Строит URL для изображения иконки
  String buildImageUrl() => '$_iconFolderPath/$imageName';

  // Строит URL для изображения PNG по имени
  static String buildPngByNameUrl(String name) => '$_iconFolderPath/$name.png';

  // Строит URL для изображения SVG по имени
  static String buildSvgByNameUrl(String name) => '$_iconFolderPath/$name.svg';
}
