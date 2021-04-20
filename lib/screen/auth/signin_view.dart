part of app.auth;

class SigninScreen extends StatefulWidget {
  static String route = "/signIn";

  _SigninState createState() => _SigninState();
}

class _SigninState extends State<SigninScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final NavigationService navigator = locator<NavigationService>();

  String emailError;
  String passwordError;
  String comfirmPasswordError;

  SigninBloc signInBloc;

  bool get isPopulated =>
      email.text.isNotEmpty &&
      password.text.isNotEmpty &&
      confirmPassword.text.isNotEmpty;

  void goTo(String routeName) {
    navigator.push(route: routeName);
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

  void validatePassword(String _) {
    setState(() {
      passwordError =
          password.text.length < 6 ? 'the password is too short' : null;
    });
  }

  void validateComfirmPassword(String _) {
    if (confirmPassword.text.length < 6) {
      setState(() {
        comfirmPasswordError = 'the password is too short';
      });
    } else if (password.text != confirmPassword.text) {
      setState(() {
        comfirmPasswordError = 'passwords must match';
      });
    } else {
      setState(() {
        comfirmPasswordError = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    signInBloc = BlocProvider.of<SigninBloc>(context);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('signin_view'),
      appBar: AppBar(
        title: Text(
          "Register",
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
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Register Account",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Form(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Input(
                        label: 'Email',
                        placeholder: 'Enter your email',
                        controller: email,
                        icon: Icons.email_outlined,
                        error: emailError,
                        onChange: validateEmail,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Password',
                        placeholder: 'Enter your password',
                        controller: password,
                        isPassword: true,
                        icon: Icons.lock_outline,
                        error: passwordError,
                        onChange: validatePassword,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Confirm Password',
                        placeholder: 'Repeat your password',
                        controller: confirmPassword,
                        isPassword: true,
                        icon: Icons.lock_outline,
                        error: comfirmPasswordError,
                        onChange: validateComfirmPassword,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Button(
                        text: 'Continue',
                        onPress: () => {
                          signInBloc.add(
                            SignIn(email: email.text, password: password.text),
                          ),
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SocialButton(
                            icon: "assets/icons/google.svg",
                            onPress: () {},
                          ),
                          SocialButton(
                            icon: "assets/icons/facebook.svg",
                            onPress: () {},
                          ),
                          SocialButton(
                            icon: "assets/icons/twitter.svg",
                            onPress: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Text(
                        'By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
