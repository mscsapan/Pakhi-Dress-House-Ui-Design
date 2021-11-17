import '../model/product_list.dart';

class Product {
  final List<String> name;
  final List<String> image;
  final List<double> price;
  final double discount;
  final String size;
  final String color;

  Product(
      this.name, this.image, this.price, this.discount, this.size, this.color);
}

final List<Product> product = [
  Product(names, images, price, 60.0, 'L,M,XL,XXL', 'Black'),
];
