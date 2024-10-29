import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:practice_app/src/features/authentication/models/user_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      // -- IMAGE with ICON
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(image: AssetImage(tProfileImage))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                              child: const Icon(LineAwesomeIcons.camera_solid, color: Colors.black, size: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),

                      // -- Form Fields
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.fullName,
                              decoration: const InputDecoration(
                                  label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              initialValue: userData.email,
                              decoration: const InputDecoration(
                                  label: Text(tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              initialValue: userData.phoneNo,
                              decoration: const InputDecoration(
                                  label: Text(tPhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone_solid)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              initialValue: userData.password,
                              obscureText: true,
                              decoration: InputDecoration(
                                label: const Text(tPassword),
                                prefixIcon: const Icon(Icons.fingerprint),
                                suffixIcon:
                                IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
                              ),
                            ),
                            const SizedBox(height: tFormHeight),

                            // -- Form Submit Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () =>
                                    Get.to(() => const UpdateProfileScreen()),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: tPrimaryColor,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                              ),
                            ),
                            const SizedBox(height: tFormHeight),

                            // -- Created Date and Delete Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: tJoined,
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: tJoinedAt,
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent.withOpacity(0.1),
                                      elevation: 0,
                                      foregroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                      side: BorderSide.none),
                                  child: const Text(tDelete),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
                else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                else {
                  return const Center(child: Text('Something Went Wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}