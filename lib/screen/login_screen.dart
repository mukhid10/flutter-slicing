import 'package:flutter/material.dart';
import 'package:flutter_edspert/screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login", 
          style: TextStyle(color: Color(0xFF000000),
                fontSize: 20,fontWeight: FontWeight.w700
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset("assets/images/login.png", width: MediaQuery.of(context).size.width*0.7,),
                const SizedBox(height: 56,),
                const Text('Selamat Datang', 
                    style: TextStyle(color: Color(0xFF000000), fontSize: 22, 
                    fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                const Text('Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
                    style: TextStyle(color: Color(0xFFF6A7483), fontSize: 14, 
                    fontWeight: FontWeight.w500), textAlign: TextAlign.center,)
              ],
            ),
            Column(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => const HomeScreen())
                    );
                },
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google-logo.png'),
                    const SizedBox(width: 12,),
                    const Text("Masuk dengan Google", style: TextStyle(color: Colors.black),),
                  ],
                )),
                ElevatedButton(onPressed: (){}, 
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/apple-logo.png'),
                    const SizedBox(width: 12,),
                    const Text("Masuk dengan Apple ID"),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}