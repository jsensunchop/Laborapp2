import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Documents/documentsUpload.dart';
import 'package:laborapp_trabajador/JobScreens/jobInterest.dart';
import 'package:laborapp_trabajador/Localization/localizationScreen.dart';
import 'package:laborapp_trabajador/Offers/OfferScreen.dart';
import 'package:laborapp_trabajador/Offers/OfferSended.dart';
import 'package:laborapp_trabajador/Offers/ShowCurrentOffers.dart';
import 'package:laborapp_trabajador/Profile/ProfileLanding.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/Splash/AppSplash.dart';
import 'package:laborapp_trabajador/popUps/TermsScreen.dart';

import '../Landing/Landing.dart';
import '../SignUp/signUpPassword.dart';
import '../SignUp/signUpScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutesNames.Splash:
        return MaterialPageRoute(builder: (_) => AppSplash());
      case RoutesNames.Landing:
        return MaterialPageRoute(builder: (_) => Landing());
      case RoutesNames.SignUpScreen:
        return MaterialPageRoute(builder: (_) => signUpScreen());
      case RoutesNames.SignUpPassword:
        return MaterialPageRoute(builder: (_) => SignUpPassword());
      case RoutesNames.ProfileLanding:
        return MaterialPageRoute(builder: (_) => ProfileLanding());
      case RoutesNames.DocumentsUpload:
        return MaterialPageRoute(builder: (_) => documentsUpload());
      case RoutesNames.LocalizationScreen:
        return MaterialPageRoute(builder: (_) => localizationScreen());
      case RoutesNames.OfferScreen:
        return MaterialPageRoute(builder: (_) => OfferScreen());
      case RoutesNames.OfferSended:
        return MaterialPageRoute(builder: (_) => OfferSended());
      case RoutesNames.JobInterested:
        return MaterialPageRoute(builder: (_) => jobInterest());
      case RoutesNames.TermsScreen:
        return MaterialPageRoute(builder: (_) => TermsScreen());
      case RoutesNames.ShowCurrentOffers:
        return MaterialPageRoute(builder: (_) => ShowCurrentOffers());
    }
  }
}
