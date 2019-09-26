import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/ui/home_page.dart';
import 'package:wallet_ui/ui/other_page.dart';

class Menu {
  String title;
  IconData icon;
  Widget widget;

  Menu(this.title, this.icon, this.widget);
}

getMenuItems() {
  return [
    Menu('Home', Icons.home, HomePage(title: 'Wallet App')),
    Menu('Deals', Icons.local_offer, OtherPage(title: 'Deals')),
    Menu('Finance', Icons.attach_money, OtherPage(title: 'Finance')),
    Menu('Wallet', Icons.account_balance_wallet, OtherPage(title: 'Wallet')),
    Menu('History', Icons.history, OtherPage(title: 'History')),
  ];
}
