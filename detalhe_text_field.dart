TextField(
  controller: _controllers[index * 2],
  decoration: InputDecoration(
    labelText: 'Name',
  ),
  onChanged: (value) {
    setState(() {
      _items[index].name = value;
    });
  },
),
