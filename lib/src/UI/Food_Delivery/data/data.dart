class Category {
  Category(this.name, this.image);
   final String name;
   final String image;
}

class Populares {
  Populares(this.name,  this.category, this.image,this.price1, this.price2);
  final String name;
   final String category;
   final String image;
   final String price1;
   final String price2;
}

class Restaurant {
  Restaurant(this.name, this.available, this.image, this.price1, this.price2);
  final String name;
   final String available;
   final String image;
   final String price1;
   final String price2;
}

final listaCategoria = <Category>[
  Category('Pizzas', 'assets/food_delivery/pizza.jpg'),
  Category('Hamburguesas', 'assets/food_delivery/filete.png'),
  Category('Bebidas', 'assets/food_delivery/drinks.jpg'),
  Category('Sushi', 'assets/food_delivery/sushi.png'),
  Category('Ceviche', 'assets/food_delivery/ceviche.png'),

];

final listaPopulares = <Populares>[
  Populares('Pizza Napolitana','Pizzas', 'assets/food_delivery/pizza_2.png','\$15','\$10'),
  Populares('Sushi Ninja Roll','Sushi', 'assets/food_delivery/sushi.png','\$25','\$20'),
  Populares('Hamburguesa','Hamburguesas', 'assets/food_delivery/filete.png','\$5','\$8'),
  Populares('Ceviche','Ceviche', 'assets/food_delivery/ceviche.png','\$13','\$15'),
];


final listaRestaurant = <Restaurant>[
  Restaurant('Papa Jhon\'s','Disponible', 'assets/food_delivery/papa_jhons.png','\$15','\$10'),
  Restaurant('Domino\'s','No Disponible', 'assets/food_delivery/dominos.png','\$25','\$20'),
  Restaurant('Pizza Hut','Disponible', 'assets/food_delivery/pizzahut.png','\$5','\$8'),
  Restaurant('Telepizza','No Disponible', 'assets/food_delivery/telepizza.jpg','\$13','\$15'),
];
