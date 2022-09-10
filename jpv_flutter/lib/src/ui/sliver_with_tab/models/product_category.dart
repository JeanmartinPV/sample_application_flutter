class ProductCategory {
  ProductCategory({
    required this.category,
    required this.products,
  });
  final String category;
  final List<Product> products;
}

class Product {
  Product({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
  final String name;
  final String image;
  final String description;
  final String price;
}
