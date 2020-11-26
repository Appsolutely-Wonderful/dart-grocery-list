/// An entry in the shopping list
class GroceryItem {
  /// Shopping list item
  String item;

  /// Amount of this item
  double quantity;

  /// The type of unit associated with quantity
  String unit;

  /// Price per unit for tracking purposes
  double pricePerUnit;

  /// Constructs a new Grocery Item
  GroceryItem({this.item, this.quantity, this.unit, this.pricePerUnit});
}
