import 'package:flutter_application_1/screens/desserts/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class DessertsCubit extends Cubit<DessertStates> {
  DessertsCubit() : super(DessertsIntialState());

  static DessertsCubit geObject(context) => BlocProvider.of(context);

  double rate = 1.0;

  List<DessertsModel> models = [
    DessertsModel(
        imgUrl: 'assets/images/food.png',
        title: 'French Apple Pie',
        subTitle: 'Minute by tuk tuk'),
    DessertsModel(
        imgUrl: 'assets/images/max_panama.png',
        title: 'Dark Chocolate Cake',
        subTitle: 'Cakes by Tella'),
    DessertsModel(
        imgUrl: 'assets/images/muhammad_usman.png',
        title: 'Street Shake',
        subTitle: 'Café Racer'),
    DessertsModel(
        imgUrl: 'assets/images/gita_krishnamurti.png',
        title: 'Fudgy Chewy Brownies',
        subTitle: 'Minute by tuk tuk')
  ];

  void newRate() {
    emit(DessertsNewState());
  }
}
