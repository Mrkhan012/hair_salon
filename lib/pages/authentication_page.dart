import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_app/pages/home_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../utils/colors.dart';
import '../utils/flutter_toast.dart';

class AuthenticationPage extends StatefulWidget {
  final String verificationId;
  const AuthenticationPage({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final OtpFieldController otpController = OtpFieldController();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  int countdown = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (countdown == 0) {
        timer.cancel();
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  void resetCountdown() {
    setState(() {
      countdown = 60;
      startCountdown();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
                      onTap: () {},
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
                              OTPTextField(
                                controller: otpController,
                                keyboardType: TextInputType.phone,
                                length: 6,
                                width: width * 0.9,
                                fieldWidth: 40,
                                style: const TextStyle(fontSize: 17),
                                textFieldAlignment: MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.underline,
                                onChanged: (pin) {},
                                onCompleted: (pin) {},
                              ),
                              SizedBox(height: height * 0.03),
                              Text(
                                "Resend code: $countdown seconds",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: height * 0.03), // Added space
                              SizedBox(
                                width: width * 0.9,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async{
                                    final credential  = PhoneAuthProvider.credential(
                                        verificationId: widget.verificationId,
                                        smsCode: otpController.toString());

                                    try{
                                    await  auth.signInWithCredential(credential);

                                    Navigator.push(context, MaterialPageRoute(builder:
                                        (context)=> const HomePage()));

                                    }catch(e){
                                      Util.toastMessage(e.toString());

                                    }
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
