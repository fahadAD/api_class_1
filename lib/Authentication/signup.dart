import 'package:api_calsses1/Authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../WeatherProject/weather_screen.dart';
import '../home.dart';
import 'sign_Up_repo.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController signup_NameController = TextEditingController();
  TextEditingController signup_PhoneController = TextEditingController();
  TextEditingController signup_EmailController = TextEditingController();
  TextEditingController signup_PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  )),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Container(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Sign Up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
                      child: TextFormField(
                        controller: signup_NameController,
                        decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
                      child: TextFormField(
                        controller: signup_PhoneController,
                        decoration: InputDecoration(
                            hintText: "Add number & Country code (+##)",
                            labelText: "Phone number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
                      child: TextFormField(
                        controller: signup_EmailController,
                        decoration: InputDecoration(
                          hintText: "Add your valid email (@, .com )",
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
                      child: TextFormField(
                        controller: signup_PasswordController,
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async{
                          bool isSignUpDone =await SignUpRepo(names:  signup_NameController.text, passwords: signup_PasswordController.text, emails: signup_EmailController.text, phone: signup_PhoneController.text);
                          if(isSignUpDone){
                             EasyLoading.showSuccess("Signup Done");
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => WeatherScreen(),
                                 ));
                          }else{
                            return EasyLoading.showError("Error");
                          }
                        },
                        child: const Text("Sign UP")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an Account?",style: TextStyle(color: Colors.black)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ));
                            },
                            child: const Text("  Sign In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
