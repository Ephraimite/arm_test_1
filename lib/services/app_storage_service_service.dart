import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../ui/common/contants/app_constants.dart';

class AppStorageServiceService {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  saveUserName(String? accessToken) async {
    await storage.write(key: AppConstants.userNameKey, value: accessToken);
  }

  Future<String?> get getUserName async {
    final token = await storage.read(key: AppConstants.userNameKey);
    return token;
  }
}
