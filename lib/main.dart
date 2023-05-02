import 'package:flutter/material.dart';
import 'package:login_crypto/converter.dart';

void main() => runApp(const GetView());

class GetView extends StatelessWidget
{
  const GetView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp
      (
      debugShowCheckedModeBanner: false,
      home: ToLogView(),
    );
  }
}
class ToLogView extends StatefulWidget
{
  const ToLogView({super.key});

  @override
  State<ToLogView> createState() => VisitLog();
}

class VisitLog extends State<ToLogView>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: Container
        (
        //constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration
          (
          image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1609554496796-c345a5335ceb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJpdGNvaW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'), fit: BoxFit.cover),
        ),
        //margin: const EdgeInsets.only(top:42),
        child: Column
          (
          children:
          [
            const SizedBox(height: 69),
            const Center
              (
              child: Text('CRYPTOCURRENCY CONVERTER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, fontFamily: 'century schoolbook', letterSpacing: 1.5, color: Colors.white)),
            ),

            const Center
              (
              child: Text('WELCOME', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, fontFamily: 'century schoolbook', letterSpacing: 2.5, color: Colors.white)),
            ),
            const SizedBox(height: 300),
            const Center
              (
                child: Text('BUILD YOUR FUTURE', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, fontFamily: 'century schoolbook', letterSpacing: 1.2, color: Colors.blue))
            ),
            const SizedBox(height: 20),
            ElevatedButton
              (
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF01017a)), padding: MaterialStateProperty.all(const EdgeInsets.only(top:20, bottom:20, left: 100, right: 100)), shape: MaterialStateProperty.all(const StadiumBorder())),
                child: const Text('Lets Start', style: TextStyle(fontSize:25)),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (path) => const LogView()));
                }
            )
          ],
        ),
      ),
    );
  }
}
@immutable
class LogView extends StatelessWidget
{
  const LogView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp
      (
      debugShowCheckedModeBanner: false,
      home: FitState(),
    );
  }
}

class FitState extends StatefulWidget
{
  const FitState({super.key});

  @override
  State<FitState> createState() => DoAction();
}

class DoAction extends State<FitState>
{
  final user = TextEditingController(), code = TextEditingController();
  @override
  Widget build(BuildContext path)
  {
    return Scaffold
      (
      body: Container
        (
        decoration: const BoxDecoration
          (
          image: DecorationImage(image: NetworkImage('https://st3.depositphotos.com/7704198/18438/v/600/depositphotos_184381322-stock-video-bitcoin-symbol-blockchain-abstract-blurred.jpg?fbclid=IwAR1-NZURBjOXaQOHKEmhu-x5PCxWaLlxlGCjruMn6az8mgAItmz8ygpPI2A'), fit: BoxFit.cover),
        ),

        //margin: const EdgeInsets.only(top: 40),
        child: Column
          (
          children:
          [
            const SizedBox(height: 40),
            const Center
              (
              child: Text('User Login', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: Colors.white, fontFamily: "Cambria"), textAlign: TextAlign.center),
            ),
            const SizedBox(height: 30),
            // Because of const problem for (user variable), ConstrainedBox Class is used. Since, Class body cannnot be immutable.
            Center
              (
              child: ConstrainedBox
                (
                constraints: const BoxConstraints.tightFor(width: 500),
                child: TextField(controller: user, decoration: const InputDecoration(labelText: "Input Username", labelStyle: TextStyle(color: Colors.white, fontFamily: "arial"), border: OutlineInputBorder(), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))), style: const TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            // Because of const problem for (code variable), ConstrainedBox Class is used. Since, Class body cannnot be immutable.
            Center
              (
              child: ConstrainedBox
                (
                constraints: const BoxConstraints.tightFor(width: 500),
                child: TextField(controller: code, obscureText: true, decoration: const InputDecoration(labelText: "Set Passcode", labelStyle: TextStyle(color: Colors.white, fontFamily: "arial"), border: OutlineInputBorder(), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))), style: const TextStyle(color: Colors.white)),
              ),
            ),
            //TextField(controller: code, onChanged: (v){ code.text=v; }, obscureText: true, decoration: InputDecoration(labelText: "Set Passcode", labelStyle: TextStyle(color: Colors.white, fontFamily: "arial"), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))), style: TextStyle(color: Colors.white)),
            const SizedBox(height: 30),
            ElevatedButton
              (
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFcf2f74)), padding: MaterialStateProperty.all(const EdgeInsets.only(top:20, bottom:20, left: 100, right: 100)), shape: MaterialStateProperty.all(const StadiumBorder())),
              onPressed: ()
              {
                String view;
                if(user.text.contains("Mahin Mustafiz") && code.text.contains("abcd"))
                {
                  view="Login Successful...";
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Converter()));
                }else if(user.text.compareTo("")==0 && code.text.compareTo("")==0)
                {
                  view="Empty Field Value! Please provide data...";
                }else{
                  view="Invalid User! Try Again....";
                }
                showDialog
                  (
                    context: path,
                    barrierDismissible: false,
                    builder: (ctx)
                    {
                      return AlertDialog
                        (
                          title: const Text('Login Information'),
                          content: Text(view),
                          actions:
                          [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, 'OK'),
                              child: const Text('OK'),
                            ),
                          ]
                      );
                    }
                );
              },
              child: const Text('Log In', style: TextStyle(fontSize:25)),
            ),
            const SizedBox(height: 120),
            const Center
              (
              child: Text("Need to Create Account? Click Below...", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'century schoolbook', color: Colors.white, letterSpacing: 1.5)),
            ),
            const SizedBox(height: 20),
            ElevatedButton
              (
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF4a15ad)), padding: MaterialStateProperty.all(const EdgeInsets.only(top:20, bottom:20, left: 125, right: 125)), shape: MaterialStateProperty.all(const StadiumBorder())),
                child: const Text('Create Account', style: TextStyle(fontSize:25)),
                onPressed: ()
                {
                  print("Button Action Response!!");
                }
            )
          ],
        ),
      ),
    );
  }
}