import 'package:flutter_application_1/screens/onboarding/model.dart';

class OnBoardingController {
  int currentPage = 0;
  List<OnBoardingModel> models = [
    OnBoardingModel(
        imgUrl: 'assets/images/onboarding1.png',
        imgHeight: 294.81,
        imgWeidth: 225.44,
        title: 'Find Food You Love',
        subTitle:
            'Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorstep'),
    OnBoardingModel(
        imgUrl: 'assets/images/onboarding2.png',
        imgHeight: 305.91,
        imgWeidth: 241.25,
        title: 'Fast Delivery',
        subTitle: 'Fast food delivery to your home, office\nwherever you are'),
    OnBoardingModel(
        imgUrl: 'assets/images/onboarding3.png',
        imgHeight: 313.26,
        imgWeidth: 210.61,
        title: 'Live Tracking',
        subTitle:
            'Real time tracking of your food on the app\nonce you placed the order')
  ];
}
