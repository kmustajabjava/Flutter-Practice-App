import 'package:get/get.dart';
import '../../../repository/authenticate_repo.dart';
import '../../../repository/user_repo/user_repository.dart';
import '../../authentication/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.find<AuthenticationRepository>();
  final _userRepo = Get.put(UserRepository());

  Future<UserModel?> getUserData() async {
    final email = await _authRepo.fetchCurrentUserEmail();
    if (email != null) {
      final userData = await _userRepo.getUserDetails(email);
      if (userData == null) {
        // If no user data was found, notify the user
        Get.snackbar('Error', 'No user found with the provided email.');
      }
      return userData; // Return UserModel or null
    } else {
      Get.snackbar('Error', 'Login to Continue');
      return null;
    }
  }

  Future<List<UserModel>> allUserData() async {
    return await _userRepo.allUser();
  }
}

