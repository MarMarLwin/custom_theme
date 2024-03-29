import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/exceptions/exceptions.dart';
import '../../domain/entities/advicer_entity.dart';
import '../models/advice_model.dart';


abstract class AdviceRemoteDatasource {
  /// requests a random advice from free api
  /// throws a [server Exception] for all error codes
  Future<AdviceEntity> getRandomAdviceFromAPI();
}

class AdviceRemoteDatasourceImplementation implements AdviceRemoteDatasource {
  final http.Client client;

  AdviceRemoteDatasourceImplementation({required this.client});

  @override
  Future<AdviceEntity> getRandomAdviceFromAPI() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final   responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }
}