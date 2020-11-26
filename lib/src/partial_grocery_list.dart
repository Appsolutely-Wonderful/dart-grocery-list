import 'dart:collection';

import 'grocery_item.dart';

/// A section of the overall grocery list
class PartialGroceryList with IterableMixin<GroceryItem> {
  List<GroceryItem> _items = List<GroceryItem>();

  /// The length of the partial list
  get length => _items.length;

  /// Retrieve an item at the specified [index]
  GroceryItem getAt(int index) => _items[index];

  /// Add an [item] to the partial list
  void addItem(GroceryItem item) => _items.add(item);

  /// Gets a GroceryItem iterator for this list
  @override
  Iterator<GroceryItem> get iterator => _items.iterator;

  /// Removes an item from the grocery list
  void removeItem(int index) => _items.removeAt(index);

  /// Totals up the cost of all the GroceryItems in the list
  double getTotalCost() {
    double total = 0;
    _items.forEach((item) {
      total += item.pricePerUnit * item.quantity;
    });
    return total;
  }
}
