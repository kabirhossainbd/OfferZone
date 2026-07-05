import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool obscurePassword = true.obs;

  // Dummy credentials
  static const String dummyEmail = 'user@gmail.com';
  static const String dummyPassword = '123456';

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<bool> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    if (email.isEmpty || password.isEmpty) {
      errorMessage.value = 'Please fill in all fields';
      isLoading.value = false;
      return false;
    }

    if (email == dummyEmail && password == dummyPassword) {
      isLoggedIn.value = true;
      isLoading.value = false;
      return true;
    } else {
      errorMessage.value = 'Invalid credentials. Try:\nEmail: $dummyEmail\nPassword: $dummyPassword';
      isLoading.value = false;
      return false;
    }
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed('/login');
  }
}

