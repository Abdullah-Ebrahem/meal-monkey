import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache_helper.dart';
import 'package:flutter_application_1/screens/profile/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  File? selectedImage;

  List<ProfileModel> models = [
    ProfileModel(title: 'Name'),
    ProfileModel(title: 'Email'),
    ProfileModel(title: 'Mobile No'),
    ProfileModel(title: 'Address'),
    ProfileModel(
      title: 'Password',
    ),
    ProfileModel(title: 'confirm Password')
  ];

  List<TextEditingController> controllers = [
    TextEditingController(text: CacheHelper.getName()),
    TextEditingController(text: CacheHelper.getEmail()),
    TextEditingController(text: CacheHelper.getMobile()),
    TextEditingController(text: CacheHelper.getAddress()),
    TextEditingController(text: CacheHelper.getPassword()),
    TextEditingController(text: CacheHelper.getConfirmPassword())
  ];

  ProfileCubit() : super(ProfileIntialState());

  static ProfileCubit getObject(context) => BlocProvider.of(context);

  void saveProfile() {
    CacheHelper.saveName(controllers[0].text);
    CacheHelper.saveEmail(controllers[1].text);
    CacheHelper.saveMobile(controllers[2].text);
    CacheHelper.saveAddress(controllers[3].text);
    CacheHelper.savePassword(controllers[4].text);
    CacheHelper.saveConfirmPassword(controllers[5].text);
  }

  void imagePick() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      selectedImage = File(result.files.single.path!);
      CacheHelper.saveProfileImg(selectedImage!.path);
      emit(ProfileImgNewState());
    }
  }
}
