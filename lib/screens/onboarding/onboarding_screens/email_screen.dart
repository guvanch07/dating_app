import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

class Email extends StatelessWidget {
  final TabController tabController;

  const Email({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextHeader(text: 'What\'s Your Email Address?'),
                    CustomTextField(
                      hint: 'ENTER YOUR EMAIL',
                      onChanged: (value) {
                        context.read<SignupCubit>().emailChanged(value);
                      },
                    ),
                    const SizedBox(height: 100),
                    const CustomTextHeader(text: 'Choose a Password'),
                    CustomTextField(
                      hint: 'ENTER YOUR PASSWORD',
                      onChanged: (value) {
                        context.read<SignupCubit>().passwordChanged(value);
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 1,
                      selectedColor: Theme.of(context).primaryColor,
                      unselectedColor: Theme.of(context).backgroundColor,
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                        tabController: tabController, text: 'NEXT STEP'),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          print('tapped');
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          'do you have a account?',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
