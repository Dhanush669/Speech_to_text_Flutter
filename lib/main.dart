import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: listin(),
  ));
}

class listin extends StatefulWidget {
  @override
  _listinState createState() => _listinState();
}

class _listinState extends State<listin> {
  stt.SpeechToText s;
  bool islisten=false;
  String text="Tap to interact";
  @override
  void initState() {
    super.initState();
    s=stt.SpeechToText();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech to Text"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            children: <Widget>[
              AvatarGlow(
                animate: islisten,
                glowColor: Colors.redAccent[100],
                endRadius: 75.0,
                duration: Duration(seconds: 2),
                repeatPauseDuration: Duration(milliseconds: 100),
                repeat: true,
                child: FloatingActionButton(
                  onPressed: (){
                    listenn();
                  },
                  backgroundColor: Colors.redAccent,
                  child: Icon(
                    islisten? Icons.mic:Icons.mic_none,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '$text',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void listenn() async{
    if(!islisten){
      bool avai=await s.initialize(
        onStatus: (val)=>print(val),
        onError: (val) =>print(val)
      );
      if(avai){
        setState(() {
          islisten=true;
        });
        s.listen(
          onResult:(val)=>setState((){
            text=val.recognizedWords;
            print(text);
          })
        );
      }
    }
    else {
      setState(() {
        islisten=false;
        s.stop();
      });
    }
  }
}
