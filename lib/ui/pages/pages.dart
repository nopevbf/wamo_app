import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wamo_app/bloc/bloc.dart';
import 'package:wamo_app/models/models.dart';
import 'package:wamo_app/shared/shared.dart';

import '../../services/services.dart';

part 'main_page.dart';
part 'sign_in_page.dart';
part 'wrapper.dart';
part 'splash_page.dart';
part 'movie_page.dart';
part 'sign_up_page.dart';
part 'preference_page.dart';
part 'account_confirm_page.dart';

Future<File> getImage() async {
  var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  return File(image!.path);
}
