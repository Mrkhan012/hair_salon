import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_app/pages/home_page.dart';
import 'package:hair_salon_app/utils/colors.dart';

import '../utils/flutter_toast.dart';
import 'authentication_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneNumberController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    "assets/images/harii.png",
                    fit: BoxFit.cover,
                    height: height * 0.5,
                    width: width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Stack(
                  children: <Widget>[
                    Card(
                      margin: const EdgeInsets.only(top: 20.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 45.0, bottom: 20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller:phoneNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintText: "Enter Mobile Number",
                                  suffixIcon: Icon(Icons.call_rounded),
                                ),
                              ),
                              SizedBox(height: height * 0.03),
                              SizedBox(
                                width: width * 0.9,
                                height: 50,
                                child: ElevatedButton(

                                  onPressed: () {
                                    auth.verifyPhoneNumber(
                                      phoneNumber: phoneNumberController.text,
                                        verificationCompleted: (_){

                                        },
                                        verificationFailed: (e){
                                          Util.toastMessage(e.toString());

                                        },
                                        codeSent: (String verificationId, int? token){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                          AuthenticationPage(verificationId:verificationId )));
                                        },
                                        codeAutoRetrievalTimeout:
                                        (e){
                                          Util.toastMessage(e.toString());

                                        });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: darkblue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: const Text(
                                    "CONTINUE",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.03),
                              const Text("By continuing you are agree to our"),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Terms & Conditions",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text("and"),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 34.0,
                        backgroundColor: Colors.grey[200],
                        child: Center(
                          child: Image.asset("assets/images/exit.png",

                            width: width * 0.09
                            ,
                            height: height *0.06,
                          ),
                        )
                      ),
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
