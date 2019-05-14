import 'package:flutter/material.dart';
import 'package:desinsetizadora/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();
  Animation<double> animButtonSigninWidth;
  Animation<double> animButtonSigninCircula;
  AnimationController animController;
  var fundoImagem = new AssetImage('assets/fundo.jpg');
  var logoImagem = new AssetImage('assets/logo.jpg');

  @override
  void initState() {
    super.initState();
    animController = AnimationController(duration: Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    animButtonSigninWidth = Tween<double>(begin: MediaQuery.of(context).size.width, end: 50.0)
        .animate(CurvedAnimation(parent: animController, curve: Interval(0, 0.4, curve: Curves.linear)));
    animButtonSigninCircula =
        Tween<double>(begin: 8.0, end: 40.0).animate(CurvedAnimation(parent: animController, curve: Interval(0, 0.4, curve: Curves.linear)));
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
       
        child: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenSize.height,
          ),
          child: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
              colors: <Color>[
                const Color.fromRGBO(0, 0, 0, 0.7),
                const Color.fromRGBO(0, 0, 0, 0.7),
//                      const Color.fromRGBO(15, 104, 40, 0.5),
//                      const Color.fromRGBO(60, 185, 60, 0.5),
              ],
              stops: [0.2, 1.0],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: 280.0,
                    height: 280.0,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.ac_unit,
                      size: 280.0,
                      color: Colors.green,
                    ),
                  ),
                  new Form(
                      child: new Column(children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(10.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                          border: new Border(
                            bottom: new BorderSide(
                              width: 0.8,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        child: new TextField(
                          controller: emailController,
                          //initialValue: "teste@hotmail.com",
                          obscureText: false,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          decoration: new InputDecoration(
                            icon: new Icon(
                              Icons.person_outline,
                              color: Colors.green,
                            ),
                            border: InputBorder.none,
                            hintText: "Usuário",
                            hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
                            contentPadding: const EdgeInsets.only(top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.all(10.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                          border: new Border(
                            bottom: new BorderSide(
                              width: 0.8,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        child: new TextField(
                          controller: senhaController,
                          obscureText: false,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          decoration: new InputDecoration(
                            icon: new Icon(
                              Icons.lock,
                              color: Colors.green,
                            ),
                            border: InputBorder.none,
                            hintText: "Senha",
                            hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
                            contentPadding: const EdgeInsets.only(top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: animController,
                      builder: (BuildContext context, Widget child) {
                        return buttonSignIn(
                            onTap: _onTap,
                            width: animButtonSigninWidth.value,
                            circular: animButtonSigninCircula.value,
                            isLoading: animButtonSigninCircula.value > 8.0);
                      },
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: new MaterialButton(
                        minWidth: 200.0,
                        height: 46.0,
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        color: Colors.white,
                        child: Text('Login'),
                      ),
                    ),
                  ]))
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  _onTap() {
    if (animController.value > 0) {
      animController.reverse();
    } else {
      animController.forward();
    }
  }

  Widget buttonSignIn(
      {bool isLoading = false,
      double circular = 8.0,
      double width = double.infinity,
      double height = 50,
      Function onTap,
      EdgeInsets padding = const EdgeInsets.only(right: 30.0, left: 30.0, top: 70, bottom: 70)}) {
    _loading() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    _text() {
      return Text(
        "Entrar",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.white),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(circular),
              color: Colors.green,
            ),
            alignment: Alignment.center,
            child: isLoading ? _loading() : _text()),
      ),
    );
  }
}
