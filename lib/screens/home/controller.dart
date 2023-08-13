import 'package:flutter_application_1/screens/home/model.dart';
import 'package:flutter_application_1/screens/home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialState());

  static HomeCubit getObject(context) => BlocProvider.of(context);

  String? selectedItem = 'Mansoura';
  List<String> items = ['Mansoura', 'Cairo', 'Giza', 'Alex'];

  List<RestaurentModel> models = [
    RestaurentModel(
        imgUrl: 'assets/images/aurelien_lemasson.png',
        title: 'Minute by tuk tuk'),
    RestaurentModel(
        imgUrl: 'assets/images/heather_ford.png', title: 'Café de Noir'),
    RestaurentModel(
        imgUrl: 'assets/images/prakash.png', title: 'Bakes by Tella')
  ];

  List<RestaurentModel> mostPopularModels = [
    RestaurentModel(
        imgUrl: 'assets/images/cafe_de_bambaa.png', title: 'Café De Bambaa'),
    RestaurentModel(
        imgUrl: 'assets/images/burger_by_bella.png', title: 'Burger by Bella'),
  ];

  List<String> imgUrl = [
    'assets/images/offers.png',
    'assets/images/sri_lankan.png',
    'assets/images/italian.png',
    'assets/images/indian.png'
  ];
  List<String> titles = ['Offers', 'Sri Lankan', 'Italian', 'Indian'];

  void locationNewState() {
    emit(HomeLocationNewState());
  }

  void newRate() {
    emit(HomeNewRateState());
  }
}
