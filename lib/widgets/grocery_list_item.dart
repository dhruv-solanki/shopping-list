import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({
    super.key,
    required this.groceryItems,
    required this.removeItem,
  });

  final List<GroceryItem> groceryItems;
  final void Function(GroceryItem) removeItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(groceryItems[index].id),
        background: Container(
          color: Theme.of(context).highlightColor,
        ),
        onDismissed: (direction) {
          removeItem(groceryItems[index]);
        },
        child: ListTile(
          title: Text(groceryItems[index].name),
          leading: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: groceryItems[index].category.color,
            ),
          ),
          trailing: Text(
            groceryItems[index].quantity.toString(),
          ),
        ),
      ),
    );
  }
}
