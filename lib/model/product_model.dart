import '../model/product_list.dart';

class Product {
  final String name;
  final String image;
  final double price;
  final String size;
  final String color;

  Product(this.name, this.image, this.price, this.size, this.color);
}

final List<Product> products = [
  Product(names[0], images[0], price[0], 'XL', 'Black'),
  Product(names[1], images[1], price[1], 'XL', 'Black'),
  Product(names[2], images[2], price[2], 'XL', 'Black'),
  Product(names[3], images[3], price[3], 'XL', 'Black'),
  Product(names[4], images[4], price[4], 'XL', 'Black'),
  Product(names[5], images[5], price[5], 'XL', 'Black'),
  Product(names[6], images[6], price[6], 'XL', 'Black'),
  Product(names[7], images[7], price[7], 'XL', 'Black'),
  Product(names[8], images[8], price[8], 'XL', 'Black'),
  Product(names[9], images[9], price[9], 'XL', 'Black'),
  Product(names[10], images[10], price[10], 'XL', 'Black'),
  Product(names[11], images[11], price[11], 'XL', 'Black'),
  Product(names[12], images[12], price[12], 'XL', 'Black'),
  Product(names[13], images[13], price[13], 'XL', 'Black'),
  Product(names[14], images[14], price[14], 'XL', 'Black'),
];
