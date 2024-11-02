import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:practice_app/src/constants/sizes.dart';
import 'package:practice_app/src/repository/authenticate_repo.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/mail_verify_controller.dart';

class MailVerification extends StatelessWidget{
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: tDefaultSize*5, left: tDefaultSize, right: tDefaultSize,bottom: tDefaultSize*2,),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(LineAwesomeIcons.envelope_solid,size: 100),
            const SizedBox(height: tDefaultSize*2,),
            Text(tEmailTitle.tr, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: tDefaultSize,),
            Text(tEmailSubTitle1.tr, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
            const SizedBox(height: tDefaultSize,),
            Text(tEmailSubTitle2.tr, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
            const SizedBox(height: tDefaultSize*2,),
            SizedBox(
              width: 200,
              child: OutlinedButton(child: Text(tContinue.tr,), onPressed:()=>controller.manuallyCheckEmailVerificationStatus(),),
            ),
            const SizedBox(height: tDefaultSize*2,),
            TextButton(onPressed: ()=>controller.sendVerificationEmail(), child: Text(tEmailResendLink.tr)),
            TextButton(onPressed: ()=>AuthenticationRepository.instance.logout(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LineAwesomeIcons.long_arrow_alt_left_solid),
                    const SizedBox(width: 5,),
                    Text(tBackLogin.tr.toLowerCase()),
                  ],
                ), ),




          ],
        ),
        ),
      ),
    );
  }

}