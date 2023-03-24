ChangeNotifierProvider(
  create: (_) => ItemList(),
  child: Scaffold(
    body: Consumer<ItemList>(
      builder: (context, itemList, child) {
        if (itemList.items.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: itemList.items.length,
            itemBuilder: (context, index) {
              final item = itemList.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.quantity.toString()),
              );
            },
          );
        }
      },
    ),
  ),
),
