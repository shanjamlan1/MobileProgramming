import 'package:flutter/material.dart';
import 'package:mob_prog_project/presentation/ui/global/background.dart';
import 'package:mob_prog_project/presentation/ui/global/header.dart';
import 'package:mob_prog_project/presentation/ui/global/question_panel.dart';
import 'package:mob_prog_project/presentation/ui/global/rounded_button.dart';
import 'package:mob_prog_project/presentation/ui/global/rounded_textfield.dart';
import 'package:mob_prog_project/presentation/ui/global/text_field_container.dart';

class Body extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController username;
  final TextEditingController password1;
  final TextEditingController password2;
  final Function toLoginPage;
  final Function addUser;

  const Body({
    Key key,
    this.toLoginPage,
    this.username,
    this.email,
    this.password1,
    this.password2,
    this.addUser,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Positioned(
        top: size.height * 0.150,
        width: size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Header(
                textHeader: 'REGISTER',
                width: 30,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Column(
                children: <Widget>[
                  TextFieldContainer(
                    child: RoundedTextField(
                      myController: username,
                      isObscure: false,
                      hintText: 'Enter Username',
                      icon: Icons.person,
                    ),
                  ),
                  TextFieldContainer(
                    child: RoundedTextField(
                      myController: email,
                      isObscure: false,
                      hintText: 'Enter Email',
                      icon: Icons.email,
                    ),
                  ),
                  TextFieldContainer(
                    child: RoundedTextField(
                      myController: password1,
                      isObscure: true,
                      hintText: 'Enter Password',
                      icon: Icons.enhanced_encryption,
                    ),
                  ),
                  TextFieldContainer(
                    child: RoundedTextField(
                      myController: password2,
                      isObscure: true,
                      hintText: 'Re - Enter Password',
                      icon: Icons.enhanced_encryption,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.044,
                  ),
                  RoundedLogButton(
                    text: 'Register',
                    function: addUser,
                    color: Color(0xffff3248),
                    textColor: Colors.white,
                  ),
                ],
              ),
              QuestionPanel(
                text: 'Already Have an Account?',
                routeText: 'Login',
                function: toLoginPage,
              )
            ]),
      ),
    );
  }
}
