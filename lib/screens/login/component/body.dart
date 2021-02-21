import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/componentsnew/Round_button.dart';
import 'package:weather/componentsnew/Rounded_input_Field.dart';
import 'package:weather/componentsnew/Rounded_password_field.dart';
import 'package:weather/componentsnew/already_have_an_account.dart';
import 'package:weather/screens/login/component/background.dart';
import 'package:weather/screens/login/component/or_divider.dart';
import 'package:weather/screens/signup/Sign_Up_Screen.dart';
import 'package:weather/screens/signup/component/social_icon.dart';
import 'package:weather/weather_forecast/weather_forecast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Body extends StatelessWidget {
  // bool _isLoggedIn = false;

  // const Body({
  //   Key key,
  // }) : super(key: key);

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "LOGIN",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(height: size.height * 0.15),
            SvgPicture.asset(
              "assets/icons/login1.svg",
              height: size.height * 0.20,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (Value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WeatherForecast();
                  }),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Alreadyhaveanaccountcheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                        splashColor: Colors.transparent, // inkwell color
                        child: SocalIcon(
                          iconSrc: "assets/icons/facebook.svg",
                        ),
                        onTap: () {}),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                        splashColor: Colors.transparent, // inkwell color
                        child: SocalIcon(
                          iconSrc: "assets/icons/google-plus.svg",
                        ),
                        onTap: () async {
                          try {
                            await _googleSignIn.signIn();
                            // setState(() {
                            //     _isLoggedIn = true
                            // });
                          } catch (err) {
                            print(err);
                          }
                        }),
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
