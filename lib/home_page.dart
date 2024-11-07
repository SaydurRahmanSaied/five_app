import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Text Filed", style: TextStyle(
          color: Colors.white,
        ),),
      ),

      body: Column(
        children: [

          //Email input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Enter Your Email Address",
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),

          //password input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Enter Your Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),

          const SizedBox(height: 8,),
          //submit-button
          SizedBox(
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
                onPressed: ()
                {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if(!email.contains("@") || !email.contains(".")){
                    Fluttertoast.showToast(msg: "Invalid Email");
                  }
                  else if(password.length<4)
                    {
                      Fluttertoast.showToast(msg: "Password Should be at least 4 characters long");
                    }
                  else
                    {
                      Fluttertoast.showToast(msg: "Success.Email:"+email+"passw ord:"+password);
                    }
                 },
                child: const Text("Submit", style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),)),
          )

        ],
      ),
    );
  }
}
