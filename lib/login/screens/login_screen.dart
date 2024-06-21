import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipper_app/common/common.dart';
import 'package:shipper_app/utils/utils.dart';

import '../../resources/generated/assets.gen.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: AppSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                children: [
                  /// Logo, Title, Subtitle
                  LoginHeader(
                    image: AssetImage(
                      dark ? Assets.logos.tStoreSplashLogoWhite.path : Assets.logos.tStoreSplashLogoBlack.path,
                    ),
                    title: AppTexts.loginTitle,
                    subTitle: AppTexts.loginSubTitle,
                  ),

                  /// Form
                  const LoginForm(),

                  /// Divider
                  const AppDividerWidget(text: AppTexts.orSignInWith),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  /// Footer
                  const AppSocialButtons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
