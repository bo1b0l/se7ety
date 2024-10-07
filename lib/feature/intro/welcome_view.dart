import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constant/assets_icon.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/feature/auth/presntation/page/register_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const Image(
        width: double.infinity,
        image: AssetImage("assets/images/welcome-bg.png"),
        fit: BoxFit.fill,
      ),
      Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(
            flex: 2,
          ),
          SvgPicture.asset(AssetsIcon.logoSvg),
          const Gap(15),
          Text(
            "اهلا بيك",
            style: AppTextStyle.getHeadlineTextStyle(
                color: AppColors.primaryColor),
          ),
          const Gap(10),
          Text(
            " سجل و احجز عند دكنورك و انت في بيتك",
            style: AppTextStyle.getbodyTextStyle(color: AppColors.textColor),
          ),
          const Spacer(
            flex: 4,
          ),
          const Row(
            children: [],
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(22),
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primaryColor.withOpacity(0.3),
              ),
              child: Column(
                children: [
                  Text(
                    "سجل دلوقتي كـ ",
                    style: AppTextStyle.getTtileTextStyle(
                        color: AppColors.whiteColor),
                  ),
                  const Gap(30),
                  CustomButton(
                    text: " دكتور",
                    height: 70,
                    fontsize: 24,
                    color: AppColors.whiteColor.withOpacity(0.7),
                    onPressed: () {
                      push(context, const RegisterView(index: 0));
                    },
                  ),
                  const Gap(30),
                  CustomButton(
                    text: " مريض",
                    fontsize: 24,
                    height: 70,
                    color: AppColors.whiteColor.withOpacity(0.7),
                    onPressed: () {
                      push(context, const RegisterView(index: 1));
                    },
                  )
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ]),
      ),
    ]));
  }
}
