part of app.auth;

class ForgotPasswordScreen extends StatefulWidget {
  static String route = "${AuthScreen.route}/forgot_password";

  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();
  String emailError;

  void goTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  void validateEmail(String _) {
    String error = InputValidator.validate(<InputValidatorType>[
      InputValidatorType.empty,
      InputValidatorType.email
    ], email.text);
    if (error != null) {
      setState(() {
        emailError = error;
      });
    } else {
      setState(() {
        emailError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('forgot_password_view'),
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          textAlign: TextAlign.center,
        ),
      ),
      body: ScrollConfiguration(
        behavior: NeverGrowthScroll(),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Forgot Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Input(
                      label: 'Email',
                      placeholder: 'Enter your email',
                      controller: email,
                      icon: Icons.email_outlined,
                      error: emailError,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.15),
                    Button(text: 'Send', onPress: () {}),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16)),
                        ),
                        InkWell(
                          onTap: () => goTo(context, SigninScreen.route),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                color: primaryColor),
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
      ),
    );
  }
}
