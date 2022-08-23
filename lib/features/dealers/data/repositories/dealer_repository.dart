

import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';

class ProfileRepository {
  final dio = serviceLocator<DioSettings>().dio;
  Future<DealerCardModel> getDealersList() async {
    try{
      final response = await dio.get('v1/users/dealers/');
    }
  }
}