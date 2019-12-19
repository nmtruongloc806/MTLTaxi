import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mtltaxiapp/widgets/home/home_screen.dart';
import 'package:mtltaxiapp/widgets/signin/signin_bloc.dart';
import 'package:mtltaxiapp/widgets/signout/signout_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  SignInBloc bloc = new SignInBloc();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("ic_car_green.png"),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Welcome back!\n",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Login to continute using iCab",
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 16))
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: StreamBuilder(
                stream: bloc.emailStream,
                builder: (context, snapshot) => TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      prefixIcon: Container(
                        child: Image.asset("ic_mail.png"),
                        width: 40,
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: StreamBuilder(
                stream: bloc.passStream,
                builder: (context, snapshot) => TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      prefixIcon: Container(
                          child: Image.asset("ic_phone.png"), width: 40),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password?",
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  color: Colors.blue[700],
                  child: Text("Sign In" ,style: TextStyle(color: Colors.white),),
                  onPressed: _onClickSignIn,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: RichText(
                text: TextSpan(
                    text: "New user? ",
                    style: TextStyle(color: Color(0xff606470), fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignOutScreen()));
                              },
                          text: "Sign up for a new account",
                          style:
                              TextStyle(color: Color(0xff3277D8), fontSize: 16))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onClickSignIn(){
    if(bloc.CheckValidSignIn(_emailController.text, _passController.text))
    {
       Navigator.push(context,MaterialPageRoute( builder: (context) => HomeScreen()));
    }
  }
}
