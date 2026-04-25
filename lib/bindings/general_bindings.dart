import 'package:get/get.dart';

import '../features/auth/controllers/login/login_controller.dart';
import '../features/personalization/controllers/user_controller.dart';
import '../utils/network/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserController());
    Get.put(LoginController());
  }
}
