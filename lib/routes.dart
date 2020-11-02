import 'package:dance/ui-screens/home/home_screen.dart';
import 'package:dance/ui-screens/home/profile_looking_for_screen.dart';
import 'package:dance/ui-screens/home/settings_screen.dart';
import 'package:dance/ui-screens/login/date_screen.dart';
import 'package:dance/ui-screens/login/profile-registration/dancer_profile_screen.dart';
import 'package:dance/ui-screens/login/profile-registration/instructor_profile_screen.dart';
import 'package:dance/ui-screens/login/reg_screen.dart';
import 'package:dance/ui-screens/login/user_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:dance/ui-screens/login/app_screen.dart';
import 'package:dance/ui-screens/login/login_screen.dart';

import 'package:dance/ui-screens/login/forgot-password.dart';
import 'package:dance/ui-screens/login/login_email_screen.dart';
import 'package:dance/ui-screens/login/login_facebook_screen.dart';
import 'package:dance/ui-screens/login/login_other_screen.dart';
import 'package:dance/ui-screens/login/restore_password.dart';

final routes = {
  //PAGES
  '/': (BuildContext context) => new AppScreen(),
  '/login': (BuildContext context) => new Login(),
  '/login-facebook': (BuildContext context) => new LoginFacebook(),
  '/login-email': (BuildContext context) => new LoginEmail(),
  '/forgot-password': (BuildContext context) => new ResetPassword(),
  '/login-other': (BuildContext context) => new LoginOther(),
  '/restore-password': (BuildContext context) => new RestorePassword(),
  '/dancer-profile': (BuildContext context) => new DancerProfile(),
  '/instructor-profile': (BuildContext context) => new InstructorProfile(),
  '/registration-profile': (BuildContext context) => new RegForm(),
  '/user-type': (BuildContext context) => new UserType(),
  '/date-form': (BuildContext context) => new DateForm(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/looking-for': (BuildContext context) => new LookingForScreen(),
  '/settings': (BuildContext context) => new SettingsScreen(),
};
