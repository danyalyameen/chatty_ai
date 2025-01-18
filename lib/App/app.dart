import 'package:chatty_ai/Features/AI%20Assistants/Views/ai_assistants_view.dart';
import 'package:chatty_ai/Features/Chat/Views/chat_view.dart';
import 'package:chatty_ai/Features/History/Attach%20Views/Search/Views/search_view.dart';
import 'package:chatty_ai/Features/History/Views/history_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: ChatView),
    MaterialRoute(page: AIAssistantsView),
    MaterialRoute(page: HistoryView),
    MaterialRoute(page: SearchView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class App {}
