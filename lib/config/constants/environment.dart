import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static EnvironmentModel get envData => EnvironmentModel.fromJson(dotenv.env);
}

class EnvironmentModel {
  final String baseUrl;
  final String environment;

  EnvironmentModel({
    required this.baseUrl,
    required this.environment,
  });

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) =>
      EnvironmentModel(
        baseUrl: json["BASE_ULR"] ?? 'No esta configurada la variable baseUrl',
        environment:
            json["ENV"] ?? 'No esta configurada la variable environment',
      );

  Map<String, dynamic> toJson() => {
        "baseUrl": baseUrl,
        "environment": environment,
      };
}
