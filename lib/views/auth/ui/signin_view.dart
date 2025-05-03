import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';
import 'package:market/views/auth/ui/login_view.dart';
import 'package:market/views/auth/ui/widget/customformfield.dart';
import 'package:market/views/auth/ui/widget/login_type.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

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
                            keybordType: TextInputType.name,
                            hintText: "Name",
                            labelText: "Name",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: CustomTextFormField(
                            keybordType: TextInputType.emailAddress,
                            hintText: "Email",
                            labelText: "Email",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: CustomTextFormField(
                            keybordType: TextInputType.visiblePassword,
                            isPassword: true,
                            hintText: "Password",
                            labelText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.visibility_off),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        LoginType(text: "Sign up", onPressed: () {}),
                        SizedBox(height: 20),
                        LoginType(
                          text: "Sign up With Google",
                          onPressed: () {},
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.kBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginView(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
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
