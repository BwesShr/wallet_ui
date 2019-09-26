import 'package:flutter/material.dart';
import 'package:wallet_ui/ui/other_page.dart';

class Item {
  String title;
  IconData icon;
  Widget widget;

  Item(this.title, this.icon, this.widget);
}

List<Item> getItems() {
  return [
    Item(
      'Top Up',
      Icons.attach_money,
      OtherPage(title: 'Top Up'),
    ),
    Item(
      'Landline',
      Icons.attach_money,
      OtherPage(title: 'Landline'),
    ),
    Item(
      'Electricity',
      Icons.attach_money,
      OtherPage(title: 'Electricity'),
    ),
    Item(
      'Water Supply',
      Icons.attach_money,
      OtherPage(title: 'Water Supply'),
    ),
    Item(
      'Cable',
      Icons.attach_money,
      OtherPage(title: 'Cable'),
    ),
    Item(
      'Internet',
      Icons.attach_money,
      OtherPage(title: 'Internet'),
    ),
    Item(
      'Share',
      Icons.attach_money,
      OtherPage(title: 'Share'),
    ),
    Item(
      'Insurance',
      Icons.attach_money,
      OtherPage(title: 'Insurance'),
    ),
    Item(
      'Credit Card',
      Icons.attach_money,
      OtherPage(title: 'Credit Card'),
    ),
    Item(
      'Flight',
      Icons.attach_money,
      OtherPage(title: 'Flight'),
    ),
    Item(
      'Movie',
      Icons.attach_money,
      OtherPage(title: 'Movie'),
    ),
    Item(
      'Event',
      Icons.attach_money,
      OtherPage(title: 'Event'),
    ),
  ];
}
