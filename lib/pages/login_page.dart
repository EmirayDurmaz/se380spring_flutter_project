import 'package:flutter/material.dart';
import 'package:se380spring_flutter_project/components/my_button.dart';
import 'package:se380spring_flutter_project/components/my_textfield.dart';


class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  // text editing controller

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method

   void signUserIn() {

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment :  MainAxisAlignment.center,
            children: [
              Container(
                height: 120, // Boyutunu isteğe göre artırabilirsin
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Köşeleri yumuşatma
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/mainlogo.png",
                    fit: BoxFit.cover, // Görseli kırpmadan güzel yerleştir
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                    color: Colors.grey[700]!,
                fontSize:16,
                ),
              ),

              const SizedBox(height:25),

             //username textfield
             MyTextField(
              controller: usernameController,
               hintText: 'Username',
               obscureText: false,
             ),

              const SizedBox(height: 10),
              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),


              const SizedBox(height: 10),

                // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              MyButton(
                onTap: signUserIn,
              ),


              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a member?',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(width: 4),
              const Text(
                'Register now',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ],
        ),
      ),
      ),
    );
  }
}
