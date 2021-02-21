import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather/componentsnew/Round_button.dart';
import 'package:weather/componentsnew/Rounded_input_Field.dart';
import 'package:weather/componentsnew/Rounded_password_field.dart';
import 'package:weather/componentsnew/already_have_an_account.dart';
import 'package:weather/screens/login/Login_screen.dart';
import 'package:weather/screens/signup/component/background.dart';
import 'package:weather/screens/signup/component/or_divider.dart';
import 'package:weather/screens/signup/component/social_icon.dart';

class Body extends StatelessWidget {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "SIGNUP",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            Alreadyhaveanaccountcheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                        splashColor: Colors.transparent, // inkwell color
                        child: SocalIcon(
                          iconSrc: "assets/icons/google-plus.svg",
                        ),
                        onTap: () async{
                          try{
                            await _googleSignIn.signIn();
                          }catch(err){
                            print(err);
                          }
                        }
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}