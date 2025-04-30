import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';
import 'package:market/core/customformfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColor.kScaffoldColor,
        body: ListView(
          children: [
            Container(
              color: AppColor.kScaffoldColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 75),
                  Text(
                    "Welcom To Mo Market",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kBlackColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.kWhiteColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: EdgeInsets.all(35),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: CustomTextFormField(
                            hintText: "Email",
                            labelText: "Email",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: CustomTextFormField(
                            
                            isPassword: true,
                            hintText: "Password",
                            labelText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.visibility_off_outlined),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(left: 170),
                            child: Text(
                              textAlign: TextAlign.end,
                              "Forget Password?",
                              style: TextStyle(
                                color: AppColor.kPrimaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.kBlackColor,
                              ),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: AppColor.kPrimaryColor,
                              onPressed: () {},
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppColor.kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              "Login With Google",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.kBlackColor,
                              ),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: AppColor.kPrimaryColor,
                              onPressed: () {},
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppColor.kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.kBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: AppColor.kPrimaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
