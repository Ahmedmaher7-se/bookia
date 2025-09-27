import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/auth/presentation/login/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildLoginBody(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?'),
          TextButton(
            onPressed: () {
              pushTo(context, Routes.register);
            },
            child: Text(
              'Register Now',
              style: TextStyles.styleSize14(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildLoginBody() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Welcome back! Glad to see you, Again!',
              style: TextStyles.styleSize30(),
            ),
            Gap(32),

            CustomTextField(
              controller: emailController,
              hint: 'Enter your email',
            ),
            Gap(15),
            CustomTextField(
              controller: passwordController,
              hint: 'Enter your password',
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SvgPicture.asset(AppImages.eyeSvg)],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.styleSize16(),
                  ),
                ),
              ],
            ),
            Gap(30),
            MainButton(text: 'Login', onPressed: () {}),
            Gap(34),

            SocialLogin(),
          ],
        ),
      ),
    );
  }
}
