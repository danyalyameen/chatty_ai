import 'package:chatty_ai/Features/AI%20Assistants/Views/ai_assistants_view.dart';
import 'package:chatty_ai/Features/Chat/Views/chat_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: ChatView),
    MaterialRoute(page: AIAssistantsView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
