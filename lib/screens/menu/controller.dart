import 'package:flutter_application_1/screens/desserts/view.dart';
import 'package:flutter_application_1/screens/menu/model.dart';

class MenuCubit {
  List<MenuModel> models = [
    MenuModel(
        imgUrl: 'assets/images/menu1.png', tite: 'Food', subtitle: '120 items'),
    MenuModel(
        imgUrl: 'assets/images/menu2.png',
        tite: 'Beverages',
        subtitle: '220 items'),
    MenuModel(
        imgUrl: 'assets/images/menu3.png',
        tite: 'Desserts',
        subtitle: '155 items'),
    MenuModel(
        imgUrl: 'assets/images/menu4.png',
        tite: 'Promotions',
        subtitle: '25 items')
  ];

  var screens = const [
    DessertsScreen(),
    DessertsScreen(),
    DessertsScreen(),
    DessertsScreen()
  ];
}
