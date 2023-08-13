import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/master/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/view.dart';
import '../latest_offer/view.dart';
import '../menu/view.dart';
import '../more/view.dart';
import '../profile/view.dart';

class MasterCubit extends Cubit<MasterStates> {
  MasterCubit() : super(MasterInitialState());

  static MasterCubit getObject(context) => BlocProvider.of(context);
  var screens = [
    const MenuScreen(),
    LatestOffersScreen(),
    const ProfileScreen(),
    const MoreScreen(),
    const HomeScreen()
  ];

  List<IconData> icons = const [
    Icons.menu_rounded,
    Icons.shopping_bag_rounded,
    Icons.person,
    Icons.read_more_sharp,
  ];

  List<String> titles = ['Menu', 'Offers', 'Profile', 'More'];

  void iSelected() {
    emit(MasterIsSelected());
  }
}
