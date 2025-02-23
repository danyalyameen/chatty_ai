import 'package:chatty_ai/App/app.locator.dart';
import 'package:chatty_ai/Services/API%20Service/api_service.dart';
import 'package:chatty_ai/Services/Firebase%20Authentication/auth_service.dart';
import 'package:chatty_ai/Services/Firebase%20Firestore/firestore_service.dart';
import 'package:chatty_ai/Services/Image%20Service/image_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewModel extends BaseViewModel {
  // Initialize Services
  NavigationService navigationService = locator<NavigationService>();
  ApiService apiService = locator<ApiService>();
  AuthService authService = locator<AuthService>();
  FirestoreService firestoreService = locator<FirestoreService>();
  ImageService imageService = locator<ImageService>();
}
