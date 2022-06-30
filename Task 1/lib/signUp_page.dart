import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/reusableComponents/reusable_components.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String initialCode = '+20';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * .2,
                    child: const Image(
                      image: AssetImage('assets/images/4.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: FloatingActionButton.small(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              Text(
                'Welcome to Fashion Daily',
                style: TextStyle(fontSize: 15, color: AppColor.hintColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        color: HexColor('#263238'),
                        fontSize: 40,
                        fontFamily: AppStrings.appFont),
                  ),
                  const Spacer(),
                  defaultTextButton(function: () {}, text: 'Help ? '),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              defaultTextFormFieldWidget(
                  context: context,
                  controller: emailController,
                  errorMessage: "please enter your email",
                  inputType: TextInputType.emailAddress,
                  labelText: "email",
                  prefixIcon: Icons.mail_sharp),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CountryListPick(
                    theme: CountryTheme(
                      showEnglishName: false,
                      //show or hide flag
                      isShowFlag: true,
                      // show country title
                      isShowTitle: false,
                      //show country code
                      isShowCode: true,
                      //show or hide down icon
                      isDownIcon: false,
                      //to initial code number country
                      initialSelection: initialCode,
                    ),
                    onChanged: (CountryCode? code) {
                      setState(() {
                        if (code!.dialCode != null) {
                          initialCode = code.dialCode!;
                        } else {
                          print('country code = nul');
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: defaultTextFormFieldWidget(
                      context: context,
                      controller: phoneController,
                      errorMessage: "please enter your phone number",
                      inputType: TextInputType.phone,
                      labelText: "phone number",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              defaultTextFormFieldWidget(
                  context: context,
                  controller: passwordController,
                  errorMessage: "please enter your password",
                  inputType: TextInputType.visiblePassword,
                  labelText: "password",
                  prefixIcon: Icons.password,
                  obscureText: true),
              const SizedBox(
                height: 20,
              ),
              defaultButton(function: () {}, text: 'Log In'),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text('Or', style: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: HexColor('#93dfaa')),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign With Google',
                          style: TextStyle(
                              color: HexColor('#93dfaa'),
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/images/google.png',
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Has any accounts?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  defaultTextButton(
                      function: () {
                        Navigator.pushNamed(context, 'signin');
                      },
                      text: 'Sign in here'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Use this application according to policy rules.\n'
                ' Any kinds of violations will be subject to sanctions',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.3, color: Colors.grey, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
