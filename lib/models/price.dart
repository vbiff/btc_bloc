class Price {
  String price;
 
  Price({this.price});

  factory Price.fromDynamic(double _price) {
    return Price(
      price: _price.toString(),
    );
  }
}