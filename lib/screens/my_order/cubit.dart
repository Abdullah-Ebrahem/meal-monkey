import 'package:flutter_bloc/flutter_bloc.dart';
part 'states.dart';

class MyOrderCubit extends Cubit<MyOrderStates> {
  MyOrderCubit() : super(MyOrderIntialState());

  static MyOrderCubit getObject(context) => BlocProvider.of(context);

  void newRate() {
    emit(MyOrderRateState());
  }
}
