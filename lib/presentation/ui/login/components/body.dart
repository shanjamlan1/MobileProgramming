import 'package:flutter/material.dart';
import 'package:mob_prog_project/presentation/ui/global/background.dart';
import 'package:mob_prog_project/presentation/ui/global/header.dart';
import 'package:mob_prog_project/presentation/ui/global/question_panel.dart';
import 'package:mob_prog_project/presentation/ui/global/rounded_button.dart';
import 'package:mob_prog_project/presentation/ui/global/rounded_textfield.dart';
import 'package:mob_prog_project/presentation/ui/global/text_field_container.dart';
import 'package:mob_prog_project/presentation/ui/login/components/container_line.dart';
import 'package:mob_prog_project/presentation/ui/login/components/social_media_button.dart';

class Body extends StatelessWidget {
  final TextEditingController loginForm;
  final TextEditingController passwordForm;

  final Function registerView;
  final Function checkUser;
  final Function checkFacebookUser;

  const Body(
      {Key key,
      this.loginForm,
      this.passwordForm,
      this.registerView,
      this.checkUser,
      this.checkFacebookUser})
      : super(key: key);

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
              textHeader: 'LOGIN',
              width: 60,
            ),
            SizedBox(
              height: size.height * 0.150,
            ),
            Column(
              children: <Widget>[
                TextFieldContainer(
                  child: RoundedTextField(
                    validFunction: (val) =>
                        val.isEmpty ? 'Enter an Email' : null,
                    isObscure: false,
                    myController: loginForm,
                    hintText: 'Enter Email',
                    icon: Icons.email,
                  ),
                ),
                TextFieldContainer(
                  child: RoundedTextField(
                    validFunction: (val) => val.length < 6
                        ? 'Password must be 6 characters long'
                        : null,
                    isObscure: true,
                    hintText: 'Enter Password',
                    myController: passwordForm,
                    icon: Icons.lock,
                  ),
                ),
                RoundedLogButton(
                  text: 'LOGIN',
                  function: checkUser,
                  color: Color(0xffff3248),
                  textColor: Colors.white,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: FlatButton(
                onPressed: checkFacebookUser,
                child: Text('Forgot Password?'),
              ),
            ),
            ContainerLine(),
            QuestionPanel(
              text: 'Dont Have an Account yet?',
              routeText: 'Register',
              function: registerView,
            ),
          ],
        ),
      ),
    );
  }
}
