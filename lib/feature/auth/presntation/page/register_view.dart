import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/feature/auth/presntation/page/login_view.dart';
import 'package:se7ety/feature/homeview.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.index});
  final int index;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isobsecure = true;
  GlobalKey<FormState> formkey = GlobalKey();
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
              "لدي حساب ",
              style: AppTextStyle.getbodyTextStyle(color: AppColors.textColor),
            ),
            TextButton(
                onPressed: () {
                  pushReplacement(
                      context,
                      const LoginView(
                        index: 1,
                      ));
                },
                child: Text(
                  "سجل دخول",
                  style: AppTextStyle.getbodyTextStyle(
                      color: AppColors.primaryColor),
                ))
          ],
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
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
                  "سجل حساب جديد كـ  ${handelUserType(widget.index)}",
                  style: AppTextStyle.getTtileTextStyle(
                      color: AppColors.primaryColor),
                ),
                const Gap(20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "الاسم",
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                      )),
                ),
                const Gap(20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'من فضلك ادخل الايميل';
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخلك كلمه المرور";
                    } else if (value.length < 8) {
                      return "من فضلك اجعل كلمة السر ٨";
                    }
                    return null;
                  },
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
                    text: "تسجيل حساب",
                    textColor: AppColors.whiteColor,
                    color: AppColors.primaryColor.withOpacity(0.8),
                    height: 50,
                    fontsize: 18,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        push(context, const Homeview());
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
