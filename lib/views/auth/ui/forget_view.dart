import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';
import 'package:market/views/auth/ui/widget/custom_material_button.dart';
import 'package:market/views/auth/ui/widget/customformfield.dart';

class ForgetView extends StatelessWidget {
  const ForgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColor.kScaffoldColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 75),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Enter Your Email To Reset Password",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kBlackColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.kScaffoldColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
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
                          keybordType: TextInputType.emailAddress,
                          hintText: "Email",
                          labelText: "Email",
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Custom_Material_Button(
                          text: "Send",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
