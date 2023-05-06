//  приклад паттерну Iterator, реалізованого у сценарії з кошиком для покупок:

// Клас товару представляє товар у кошику
class Item {
  final String name;
  final double price;

  Item(this.name, this.price);
}

// Клас ShoppingCart - це колекція Iterable, яку ми хочемо обходити
class ShoppingCart extends Iterable<Item> {
  final List<Item> _items = [];

  // Спосіб додавання товарів до кошика
  void addItem(Item item) {
    _items.add(item);
  }

  // Необхідна реалізація методу фабрики ітераторів Iterable
  @override
  Iterator<Item> get iterator => _ItemIterator(_items);
}

// Клас ItemIterator реалізує інтерфейс Iterator
class _ItemIterator implements Iterator<Item> {
  int _currentIndex = 0;
  final List<Item> _items;

  _ItemIterator(this._items);

  // Необхідна реалізація методу moveNext в ітераторі
  @override
  bool moveNext() {
    if (_currentIndex < _items.length) {
      _currentIndex++;
      return true;
    } else {
      return false;
    }
  }

  // Необхідна реалізація методу current Iterator
  @override
  Item get current => _items[_currentIndex - 1];
}

// Приклад використання паттерну Iterator
void main() {
  // Створіть кошик і додайте до нього товари
  final cart = ShoppingCart();
  cart.addItem(Item("Milk", 3.99));
  cart.addItem(Item("Eggs", 2.99));
  cart.addItem(Item("Bread", 1.99));
  cart.addItem(Item("Cheese", 4.99));

  // Обхід кошика за допомогою ітератора
  final iterator = cart.iterator;
  while (iterator.moveNext()) {
    // final item = iterator.current;
    // print("${item.name}: \$${item.price}");
    // final item = iterator.current;
    print("${iterator.current.name}: \$${iterator.current.price}");
  }
}
