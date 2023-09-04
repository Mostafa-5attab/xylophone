// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xylophone/login/componet.dart';

class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  var email = TextEditingController();
  var password = TextEditingController();
  var forKey = GlobalKey<FormState>();
  bool showPassword = true;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: forKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      bool emailVaild = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&' *+-/=?^_` {|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                      if(value.isEmpty){
                        return "Enter Email";
                      }else if(!emailVaild){
                        return "Enter Email Valid";
                      }
                    },
                    // onFieldSubmitted: (String value){
                    //   print(value);
                    // },
                    // onChanged: (String value){
                    //   print(value);
                    // },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email Addres",
                      prefixIcon: Icon(
                        Icons.email,
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value){
                      if (value!.isEmpty){
                        return "Enter Password ";
                      }else if (password.text.length < 7){
                        return "password should be more than 7 characters";
                      }

                    },
                    // onFieldSubmitted: (String value){
                    //   print(value);
                    // },
                    // onChanged: (String value){
                    //   print(value);
                    // },
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Pssword",
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                           showPassword? Icons.visibility : Icons.visibility_off
                          ),
                        ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      width: double.infinity,
                      background: Colors.blue,
                      function: (){
                        if (forKey.currentState!.validate()){
                          print(email.text);
                          print(password.text);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context)=>messenger_screen())
                          // );

                        };
                      },
                      text: "login",
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: (){},
                          child: const Text("Register Now"),
                      )
                    ],

                  ),
                  Center(
                    child: MaterialButton(
                        onPressed: (){
                          _googleSignIn.signIn().then((value) {
                            String userName = value!.displayName!;
                            String ProfilePictcher = value!.photoUrl!;
                            print(userName);
                          });
                        },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

