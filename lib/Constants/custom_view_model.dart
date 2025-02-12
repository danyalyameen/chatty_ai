import 'package:chatty_ai/App/app.locator.dart';
import 'package:chatty_ai/Services/API%20Service/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  ApiService apiService = locator<ApiService>();
}
