import 'package:flutter_application_1/screens/latest_offer/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class OffersCubit extends Cubit<OffersStates> {
  OffersCubit() : super(OffersIntialState());

  static OffersCubit getObject(context) => BlocProvider.of(context);

  List<OffersModel> models = [
    OffersModel(
        imgUrl: 'assets/images/heather_ford.png', title: 'Café de Noires'),
    OffersModel(imgUrl: 'assets/images/davide.png', title: 'Isso'),
    OffersModel(imgUrl: 'assets/images/coffe.png', title: 'Cafe Beans')
  ];

  void newRate() {
    emit(OffersNewState());
  }
}
