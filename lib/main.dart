import 'package:flutter/material.dart';
import 'package:login_animation/behaviors/hidden_scroll_behavior.dart';

void main()=>runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login beautiful login',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.black54,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 500)
    );
    _iconAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticIn
    );
    _iconAnimation.addListener(()=>this.setState(()=>{}));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/login-background.jpeg"),
            fit: BoxFit.cover,
            color: Theme.of(context).backgroundColor,
            colorBlendMode: BlendMode.darken,
          ),
          ScrollConfiguration(
            behavior: HiddenScrollBehavior(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    FlutterLogo(
                      style: FlutterLogoStyle.markOnly,
                      size: _iconAnimation.value * 200,
                    ),
                    Padding(padding: EdgeInsets.only(top: 70.0)),
                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email Address",
                          labelStyle: TextStyle(
                            fontSize: 20.0
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 40.0)),
                    TextFormField(
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 20.0
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
                      child: MaterialButton(
                          padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 10.0),
                          elevation: 0.0,
                          color: Colors.lightGreen,
                          child: Icon(Icons.lock,),
                          onPressed: ()=>{}
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}