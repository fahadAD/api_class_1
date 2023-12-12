import 'package:api_calsses1/Authentication/sign_IN_repo.dart';
import 'package:api_calsses1/Authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../WeatherProject/weather_screen.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController login_EmailController=TextEditingController();
  TextEditingController login_PasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        child: Column(

          children: [

            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  )),
            ),
SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Sign In",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                      child: TextFormField(
                        controller: login_EmailController,
                        decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                      child: TextFormField(
                        controller: login_PasswordController,
                        decoration: const InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),

                    ElevatedButton(onPressed: () async {
                      EasyLoading.show(status: 'loading....');
                      bool signInDone= await SignInRepo(passwords: login_PasswordController.text, emails: login_EmailController.text);
                      if(signInDone){
                        EasyLoading.showSuccess("Sign In Done");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherScreen(),
                            ));
                      }else{
                        return EasyLoading.showError("Error");
                      }


                    }, child: const Text("Sign In")),

                    Row(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        Text("Don't Have an Account?",style: TextStyle(color: Colors.black)),
                        TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                        }, child: const Text(" Signup",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              height: 175,
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
