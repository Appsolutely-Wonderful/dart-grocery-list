import 'grocery_item.dart';
import 'partial_grocery_list.dart';

/// Accessor for grocery list
enum GroceryListSection {
  /// Access the checked item list
  Checked,

  /// Access the unchecked section of the item list
  Unchecked
}

/// Represents a grocery list that uses GroceryItem entries
class GroceryList {
  PartialGroceryList _uncheckedItems = PartialGroceryList();
  PartialGroceryList _checkedItems = PartialGroceryList();

  /// Get the length of a section of the list
  int count(GroceryListSection section) {
    switch (section) {
      case GroceryListSection.Checked:
        return _checkedItems.length;
      case GroceryListSection.Unchecked:
        return _uncheckedItems.length;
    }
  }

  /// Get an item from the grocery list
  GroceryItem getAt(GroceryListSection section, int index) {
    switch (section) {
      case GroceryListSection.Checked:
        return _checkedItems.getAt(index);
      case GroceryListSection.Unchecked:
        return _uncheckedItems.getAt(index);
    }
  }

  Iterator<GroceryItem> getIterator(GroceryListSection section) {
    switch (section) {
      case GroceryListSection.Checked:
        return _checkedItems.iterator;
      case GroceryListSection.Unchecked:
        return _uncheckedItems.iterator;
    }
  }

  /// Add an item to the grocery list
  void addItem(GroceryItem item) {
    _uncheckedItems.add(item);
  }

  /// Removes an item from the grocery list
  void removeItem(GroceryListSection section, int index) {
    switch (section) {
      case GroceryListSection.Checked:
        return _checkedItems.removeItem(index);
      case GroceryListSection.Unchecked:
        return _uncheckedItems.removeItem(index);
    }
  }

  void checkItem(int index) {
    GroceryItem item = _uncheckedItems.getAt(index);
    _uncheckedItems.removeItem(index);
    _checkedItems.addItem(item);
  }

  void uncheckItem(int index) {
    GroceryItem item = _checkedItems.getAt(index);
    _checkedItems.removeItem(index);
    _uncheckedItems.addItem(item);
  }

  void clearCheckedItems() {
    _checkedItems = PartialGroceryList();
  }

  double getTotalCost() {
    return _uncheckedItems.getTotalCost() + _checkedItems.getTotalCost();
  }
}
