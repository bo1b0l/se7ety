import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/feature/auth/presntation/page/register_view.dart';

class LoginView extends StatefulWidget {
  final int index;

  const LoginView({super.key, required this.index});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isobsecure = true;
  String handelUserType(int index) {
    return index == 0 ? "دكتور" : "مريض";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.primaryColor,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ليس لدي حساب ",
              style: AppTextStyle.getbodyTextStyle(color: AppColors.textColor),
            ),
            TextButton(
                onPressed: () {
                  pushReplacement(
                      context,
                      const RegisterView(
                        index: 0,
                      ));
                },
                child: Text(
                  "سجل الان",
                  style: AppTextStyle.getbodyTextStyle(
                      color: AppColors.primaryColor),
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Image(
                image: const AssetImage("assets/images/logo.png"),
                width: MediaQuery.sizeOf(context).width,
                height: 200,
              ),
              const Gap(30),
              Text(
                "سجل دخول كـ  ${handelUserType(1)}",
                style: AppTextStyle.getTtileTextStyle(
                    color: AppColors.primaryColor),
              ),
              const Gap(30),
              TextFormField(
                textDirection: TextDirection.ltr,
                decoration: const InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    hintText: "example@example.com",
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.primaryColor,
                    )),
              ),
              const Gap(20),
              TextFormField(
                obscureText: isobsecure,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    hintText: "* * * * * * *",
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isobsecure = !isobsecure;
                          });
                        },
                        icon: isobsecure
                            ? const Icon(
                                Icons.remove_red_eye,
                                color: AppColors.primaryColor,
                              )
                            : const Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.primaryColor,
                              ))),
              ),
              const Gap(30),
              CustomButton(
                  text: "تسجيل دخول",
                  textColor: AppColors.whiteColor,
                  color: AppColors.primaryColor.withOpacity(0.8),
                  height: 50,
                  fontsize: 18,
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
