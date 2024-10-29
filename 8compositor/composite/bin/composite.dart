abstract class IProduct {
  int cost();
  String name();
}

class Product implements IProduct {
  final String _name;
  final int _cost;

  Product(this._name, this._cost);

  @override
  int cost() => _cost;

  @override
  String name() => _name;
}

class CompoundProduct implements IProduct {
  final String _name;
  List productList = <IProduct>[];

  CompoundProduct(this._name);

  @override
  int cost() {
    var totalCost = 0;
    productList.forEach((item) {
      totalCost += item.cost() as int;
    });
    return totalCost;
  }

  void addProduct(IProduct product) {
    productList.add(product);
  }

  void removeProduct(IProduct product) {
    productList.remove(product);
  }

  @override
  String name() => _name;
}

void main() {
  final dough = CompoundProduct('Dough');
  dough.addProduct(Product('flour', 3));
  dough.addProduct(Product('egg', 10));
  print(dough.cost());
}
