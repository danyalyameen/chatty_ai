class ApiModel {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;
  String? serviceTier;
  String? systemFingerprint;

  ApiModel(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage,
      this.serviceTier,
      this.systemFingerprint});

  ApiModel.store(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach(
        (v) {
          choices!.add(Choices.store(v));
        },
      );
    }
    usage = json['usage'] != null ? Usage.store(json['usage']) : null;
    serviceTier = json['service_tier'];
    systemFingerprint = json['system_fingerprint'];
  }

  Map<String, dynamic> recieve() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.recieve()).toList();
    }
    if (usage != null) {
      data['usage'] = usage!.recieve();
    }
    data['service_tier'] = serviceTier;
    data['system_fingerprint'] = systemFingerprint;
    return data;
  }
}

class Choices {
  int? index;
  Message? message;
  Null logprobs;
  String? finishReason;

  Choices({this.index, this.message, this.logprobs, this.finishReason});

  Choices.store(Map<String, dynamic> json) {
    index = json['index'];
    message = json['message'] != null ? Message.store(json['message']) : null;
    logprobs = json['logprobs'];
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> recieve() {
    final Map<String, dynamic> data = {};
    data['index'] = index;
    if (message != null) {
      data['message'] = message!.recieve();
    }
    data['logprobs'] = logprobs;
    data['finish_reason'] = finishReason;
    return data;
  }
}

class Message {
  String? role;
  String? content;
  Null refusal;

  Message({this.role, this.content, this.refusal});

  Message.store(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
    refusal = json['refusal'];
  }

  Map<String, dynamic> recieve() {
    final Map<String, dynamic> data = {};
    data['role'] = role;
    data['content'] = content;
    data['refusal'] = refusal;
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;
  PromptTokensDetails? promptTokensDetails;
  CompletionTokensDetails? completionTokensDetails;

  Usage(
      {this.promptTokens,
      this.completionTokens,
      this.totalTokens,
      this.promptTokensDetails,
      this.completionTokensDetails});

  Usage.store(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
    promptTokensDetails = json['prompt_tokens_details'] != null
        ? PromptTokensDetails.store(json['prompt_tokens_details'])
        : null;
    completionTokensDetails = json['completion_tokens_details'] != null
        ? CompletionTokensDetails.store(json['completion_tokens_details'])
        : null;
  }

  Map<String, dynamic> recieve() {
    final Map<String, dynamic> data = {};
    data['prompt_tokens'] = promptTokens;
    data['completion_tokens'] = completionTokens;
    data['total_tokens'] = totalTokens;
    if (promptTokensDetails != null) {
      data['prompt_tokens_details'] = promptTokensDetails!.recieve();
    }
    if (completionTokensDetails != null) {
      data['completion_tokens_details'] = completionTokensDetails!.recieve();
    }
    return data;
  }
}

class PromptTokensDetails {
  int? cachedTokens;
  int? audioTokens;

  PromptTokensDetails({this.cachedTokens, this.audioTokens});

  PromptTokensDetails.store(Map<String, dynamic> json) {
    cachedTokens = json['cached_tokens'];
    audioTokens = json['audio_tokens'];
  }

  Map<String, dynamic> recieve() {
    final Map<String, dynamic> data = {};
    data['cached_tokens'] = cachedTokens;
    data['audio_tokens'] = audioTokens;
    return data;
  }
}

class CompletionTokensDetails {
  int? reasoningTokens;
  int? audioTokens;
  int? acceptedPredictionTokens;
  int? rejectedPredictionTokens;

  CompletionTokensDetails(
      {this.reasoningTokens,
      this.audioTokens,
      this.acceptedPredictionTokens,
      this.rejectedPredictionTokens});

  CompletionTokensDetails.store(Map<String, dynamic> json) {
    reasoningTokens = json['reasoning_tokens'];
    audioTokens = json['audio_tokens'];
    acceptedPredictionTokens = json['accepted_prediction_tokens'];
    rejectedPredictionTokens = json['rejected_prediction_tokens'];
  }

  Map<String, dynamic> recieve() {
    final Map<String, dynamic> data = {};
    data['reasoning_tokens'] = reasoningTokens;
    data['audio_tokens'] = audioTokens;
    data['accepted_prediction_tokens'] = acceptedPredictionTokens;
    data['rejected_prediction_tokens'] = rejectedPredictionTokens;
    return data;
  }
}
