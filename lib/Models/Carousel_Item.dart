class CarouselItem {
  String imageUrl;
  String title;
  String description;
  DateTime publishDate;

  CarouselItem({
    this.imageUrl,
    this.title,
    this.description,
    this.publishDate
  });
}

final List<CarouselItem> carouselItems = [
  CarouselItem(
    imageUrl: 'assets/images/hotel0.jpg',
    title: 'Precios de Alquileres',
    description: 'Los precios en alquileres vienen subiendo, entérate cómo negociar con tu arendatario.',
    publishDate: new DateTime.utc(2020, 11, 9),
  ),
  CarouselItem(
    imageUrl: 'assets/images/hotel1.jpg',
    title: 'Nuevo servicio de entregas',
    description: 'De tu celular a la puerta de tu hogar.',
    publishDate: new DateTime.utc(2020, 11, 9),
  ),
  CarouselItem(
    imageUrl: 'assets/images/hotel2.jpg',
    title : 'Alquilar o Comprar',
    description: 'Entérate de las variables a tener en cuenta antes de comprar tu vivienda.',
    publishDate: new DateTime.utc(2020, 11, 9),
  ),
];

