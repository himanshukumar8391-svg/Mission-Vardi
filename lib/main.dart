import 'package:flutter/material.dart';

void main() => runApp(const MissionVardiApp());

class MissionVardiApp extends StatelessWidget {
  const MissionVardiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MISSION VARDI',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MainTabScreen(),
    );
  }
}

class Question {
  final String q;
  final List<String> options;
  final int ans;
  Question(this.q, this.options, this.ans);
}

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});
  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  // --- QUESTIONS DATA ---
  final Map<String, List<Question>> allQuestions = {
    "Maths": [
      Question("10, 20, 30 ka Average?", ["15", "20", "25", "30"], 1),
      Question("2+2*2 =?", ["8", "6", "4", "10"], 1),
      Question("100 ka 20%?", ["20", "30", "10", "25"], 0),
      Question("15x12 =?", ["180", "150", "170", "200"], 0),
      Question("√64 =?", ["6", "7", "8", "9"], 2),
      Question("5% of 200?", ["5", "10", "20", "15"], 1),
      Question("1 KM =? Meter", ["100", "1000", "10000", "10"], 1),
      Question("2^3 =?", ["6", "8", "9", "10"], 1),
      Question("SP=120, Profit 20%, CP?", ["100", "110", "90", "80"], 0),
      Question("A alone 10 days, B 15 days, Together?", ["6 days", "5 days", "8 days", "7 days"], 0),
    ],
    "Reasoning": [
      Question("A, B, C me B bich me hai, to?", ["A-B-C", "B-A-C", "C-B-A", "A-C-B"], 0),
      Question("Odd one: 2,4,6,7?", ["2", "4", "6", "7"], 3),
      Question("If CAT=3, DOG=3, ELEPHANT=?", ["8", "3", "5", "6"], 0),
      Question("Mirror of 12:15?", ["11:45", "12:15", "9:45", "10:15"], 0),
      Question("A north, right east, now?", ["East", "West", "North", "South"], 0),
      Question("Series: 2,4,8,16,?", ["24", "32", "30", "20"], 1),
      Question("P father of Q, Q is?", ["Son", "Daughter", "Can't say", "None"], 2),
      Question("Blood Relation: My mother son?", ["Brother", "Sister", "Me", "Father"], 0),
      Question("Coding: A=1, B=2, C=?", ["3", "4", "5", "2"], 0),
      Question("If today Monday, after 61 days?", ["Saturday", "Sunday", "Monday", "Tuesday"], 0),
    ],
    "GK": [
      Question("Bharat ka Rashtriya Geet?", ["Jana Gana Mana", "Vande Mataram", "Both", "None"], 1),
      Question("India ki Rajdhani?", ["Mumbai", "Delhi", "Kolkata", "Chennai"], 1),
      Question("Taj Mahal kahan hai?", ["Agra", "Delhi", "Jaipur", "Lucknow"], 0),
      Question("ISRO ka full form?", ["Indian Space...", "International...", "India Science...", "None"], 0),
      Question("Gandhi Jayanti?", ["2 Oct", "15 Aug", "26 Jan", "5 Sep"], 0),
      Question("National Animal?", ["Lion", "Tiger", "Elephant", "Peacock"], 1),
      Question("First PM of India?", ["Modi", "Nehru", "Gandhi", "Patel"], 1),
      Question("Yoga Day?", ["21 June", "21 July", "21 May", "21 Aug"], 0),
      Question("Kargil War year?", ["1999", "1971", "1965", "2001"], 0),
      Question("Army Day?", ["15 Jan", "15 Aug", "26 Jan", "8 Oct"], 0),
    ],
    "GS": [
      Question("Vitamin C kami se?", ["Scurvy", "Rickets", "Night blindness", "Anemia"], 0),
      Question("Light ka speed?", ["3 lakh km/s", "1 lakh", "5 lakh", "2 lakh"], 0),
      Question("Human heart kitne chamber?", ["2", "3", "4", "5"], 2),
      Question("H2O kya hai?", ["Pani", "Namak", "Chini", "Oxygen"], 0),
      Question("Gravity kisne khoji?", ["Newton", "Einstein", "Galileo", "Tesla"], 0),
      Question("Computer ka dimag?", ["CPU", "RAM", "Mouse", "Keyboard"], 0),
      Question("O2 kya hai?", ["Oxygen", "Hydrogen", "Carbon", "Nitrogen"], 0),
      Question("Blood ka color lal kyon?", ["Hemoglobin", "Plasma", "Platelet", "None"], 0),
      Question("Earth kitne din me Suraj ka chakkar?", ["365", "360", "366", "300"], 0),
      Question("Sound sabse tez kisme?", ["Thos me", "Pani me", "Hawa me", "Vacuum me"], 0),
    ],
    "Hindi": [
      Question("'Veer' ka vilom?", ["Kayar", "Bahadur", "Nidar", "Balwan"], 0),
      Question("Ram ne Ravan ko mara - Kaal?", ["Bhootkaal", "Vartman", "Bhavishya", "None"], 0),
      Question("Hindi varnmala me kitne varn?", ["52", "44", "50", "48"], 0),
      Question("'Phool' ka paryayvachi?", ["Pushp", "Patthar", "Paudha", "Ped"], 0),
      Question("Sangya ke kitne bhed?", ["5", "3", "4", "2"], 0),
      Question("'Imandari' shabd?", ["Bhavvachak", "Jativachak", "Vyakti", "Sarvnam"], 0),
      Question("Muhavara: 'Aankh ka Tara'?", ["Pyara", "Dushman", "Andha", "Gussa"], 0),
      Question("Shuddh shabd?", ["Ujjwal", "Ujwal", "Ujjawal", "Ujaval"], 0),
      Question("'Ganga' ka ling?", ["Stri", "Pulling", "Napunsak", "None"], 0),
      Question("Vachan ke kitne bhed?", ["2", "3", "4", "5"], 0),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MISSION VARDI 🇮🇳', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "MATHS", icon: Icon(Icons.calculate)),
            Tab(text: "REASONING", icon: Icon(Icons.lightbulb)),
            Tab(text: "GK", icon: Icon(Icons.public)),
            Tab(text: "GS", icon: Icon(Icons.science)),
            Tab(text: "HINDI", icon: Icon(Icons.menu_book)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: allQuestions.keys.map((cat) => QuizTab(category: cat, questions: allQuestions[cat]!)).toList(),
      ),
    );
  }
}

class QuizTab extends StatefulWidget {
  final String category;
  final List<Question> questions;
  const QuizTab({super.key, required this.category, required this.questions});
  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  int current = 0;
  int score = 0;
  bool answered = false;
  int? selected;

  void nextQ() {
    if (current < widget.questions.length - 1) {
      setState(() {current++; answered=false; selected=null;});
    } else {
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Text("${widget.category} Complete!"),
        content: Text("Score: $score / ${widget.questions.length}\nJai Hind!"),
        actions: [TextButton(onPressed: (){
          Navigator.pop(context);
          setState(() {current=0; score=0; answered=false; selected=null;});
        }, child: const Text("RESTART"))],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[current];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${widget.category} - Q ${current+1}/${widget.questions.length}", style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Score: $score", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade700)),
          ]),
          const SizedBox(height: 10),
          LinearProgressIndicator(value: (current+1)/widget.questions.length, color: Colors.orange),
          const SizedBox(height: 20),
          Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange)), child: Text(q.q, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
          const SizedBox(height: 20),
         ...List.generate(q.options.length, (i){
            Color col = Colors.white;
            if (answered) {
              if (i==q.ans) col = Colors.green.shade200;
              else if (i==selected && i!=q.ans) col = Colors.red.shade200;
            }
            return Container(margin: const EdgeInsets.only(bottom: 10), child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: col, foregroundColor: Colors.black, padding: const EdgeInsets.all(14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: answered? null : (){ setState((){selected=i; answered=true;}); if(i==q.ans) score++; },
              child: Text("${['A','B','C','D'][i]}. ${q.options[i]}", style: const TextStyle(fontSize: 16)),
            ));
          }),
          const Spacer(),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, foregroundColor: Colors.white, padding: const EdgeInsets.all(16)), onPressed: answered? nextQ : null, child: Text(current==widget.questions.length-1? "FINISH" : "NEXT")),
        ],
      ),
    );
  }
}
