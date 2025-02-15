import 'package:chatty_ai/Models/api_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  // Create Dio Variables
  final Dio dio = Dio();

  // Ask Question with AI
  Future<ApiModel> askQuestion({required String prompt}) async {
    // Hit Url
    String url = "https://api.openai.com/v1/chat/completions";
    // Post Operation
    var response = await dio.post(
      url,
      data: {
        "model": "gpt-4o-mini",
        "messages": [
          {
            "role": "user",
            "content": prompt,
          }
        ]
      },
      options: Options(
        headers: {
          // Header
          Headers.contentTypeHeader: "application/json",
          // Authorization Key
          "Authorization":
              "Bearer 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",
        },
      ),
    );
    // Store It in Api Model
    ApiModel chat = ApiModel.store(response.data);
    return chat;
  }
}
