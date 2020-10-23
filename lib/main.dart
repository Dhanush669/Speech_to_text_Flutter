import 'package:avatar_glow/avatar_glow.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:url_launcher/url_launcher.dart';
import 'package:torch_compat/torch_compat.dart';

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
  int i=0;
  FlutterTts tst=FlutterTts();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s=stt.SpeechToText();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dev__gd Assistant"),
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
    else{
      setState(() {
        i=1;
        islisten=false;
        s.stop();
        speakk(text);
      });
    }
  }
  Future speakk(String word)async{
    if(word=="Friday"||word=="hay"||word=="Hey friday") {
      await tst.speak("hello sir how are you");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="go to Google"||word=="go"||word=="Google") {
      await tst.speak("directing to google sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      const url = 'https://www.google.com';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
   else if(word=="Define"||word=="Define guru"||word=="Guru") {
      await tst.speak("Guru, a mid developer,ui designer, owner of dev gd and lot more to say and a pombala poruki");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="Day"|| word=="day") {
      await tst.speak("wednesday");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="Date"|| word=="date") {
      await tst.speak("21 october 20 20");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="Month"||word=="month") {
      await tst.speak("october");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="Twitter"||word=="twitter") {
      await tst.speak("directing to twitter sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      const url = 'https://twitter.com/?lang=en';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    else if(word=="how many"||word=="how many followers do we have") {
      await tst.speak("575");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="show our profile"||word=="dev gd profile"|| word=="dev gd") {
      await tst.speak("directing to dev gd profile sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      if (await canLaunch("https://www.instagram.com/dev__gd/")) {
        await launch("https://www.instagram.com/dev__gd/");
      } else {
        throw 'Could not launch https://www.instagram.com/dev__gd/';
      }
    }
    else if(word=="go to YouTube"||word=="youtube") {
      await tst.speak("directing to youtube sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      const url = 'https://www.youtube.com/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    else if(word=="good"||word=="Good") {
      await tst.speak("thank you sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="gopal"||word=="Gopal") {
      await tst.speak("gopal not available sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="hari"||word=="Hari") {
      await tst.speak("hari, cycle racer, 20 year old, sombayrii, play boy, and banthey");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="your name"|| word=="name") {
      await tst.speak("sornakaaa");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="it's very dark here"|| word=="its getting Dark") {
      await tst.speak("i understand sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      i=1;
      TorchCompat.turnOn();
    }
    else if(word=="torch off" && i==1) {
      await tst.speak("yes sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      i=1;
      TorchCompat.turnOff();
    }
    else if(word=="open call log"|| word=="call log") {
      await tst.speak("opening call log sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      Iterable<CallLogEntry> entries = await CallLog.get();
    }
    else if(word=="call Guru"|| word=="call Dev") {
      await tst.speak("making call to guru, sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      launch("tel:8667219696");
    }
    else if(word=="call Hari"|| word=="call hari") {
      await tst.speak("making call to hari, sir");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
      launch("tel:6383696046");
    }
    else if(word=="ok Friday bye") {
      await tst.speak("bye sir, see you later. i am offline now");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="how you speak super English") {
      await tst.speak("i use to read many data from websites sir, i develop my english like this");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else if(word=="how is our English") {
      await tst.speak("sorry to say this sir its really horrible");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
    else {
      await tst.speak("sorry sir no data available");
      //await tst.speak("");
      await tst.setLanguage("en-IN");
      await tst.setPitch(1);
    }
  }
}
