import 'package:flutter/material.dart';

void main() => runApp(const MissionVardiApp());

class MissionVardiApp extends StatelessWidget {
  const MissionVardiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MISSION VARDI',
      theme: ThemeData(primarySwatch: Colors.orange, scaffoldBackgroundColor: const Color(0xFFF8F8F8)),
      home: const HomeScreen(),
    );
  }
}

class Question {
  final String q; final List<String> o; final int ans;
  Question(this.q, this.o, this.ans);
}

// DATA FOR ALL SUBJECTS
final Map<String, List<Question>> qb = {
  "Maths": [Question("20% of 150?", ["30","40","20","50"], 0), Question("15x12=?", ["180","150","200","170"], 0), Question("Average 10,20,30?", ["15","20","25","30"], 1), Question("√64=?", ["6","8","9","7"], 1), Question("2+2*2=?", ["6","8","4","10"], 0)],
  "Reasoning": [Question("Odd: 2,4,6,7?", ["7","2","4","6"], 0), Question("Series 2,4,8,16,?", ["32","24","30","18"], 0), Question("A north, right east?", ["East","West","North","South"], 0), Question("CAT=3, DOG=3, MAN=?", ["3","2","4","5"], 0), Question("Mirror 12:15?", ["11:45","12:15","9:45","10:15"], 0)],
  "Hindi": [Question("'Veer' ka vilom?", ["Kayar","Bahadur","Nidar","Balwan"], 0), Question("Varn kitne?", ["52","44","50","48"], 0), Question("'Phool' paryay?", ["Pushp","Ped","Paudha","Patthar"], 0), Question("'Imandari' shabd?", ["Bhavvachak","Jativachak","Vyakti","Sarvnam"], 0), Question("Vachan ke bhed?", ["2","3","4","5"], 0)],
  "GK": [Question("Army Day?", ["15 Jan","26 Jan","15 Aug","8 Oct"], 0), Question("Kargil War?", ["1999","1971","1965","2001"], 0), Question("National Animal?", ["Tiger","Lion","Elephant","Peacock"], 0), Question("Taj Mahal?", ["Agra","Delhi","Jaipur","Lucknow"], 0), Question("First PM?", ["Nehru","Modi","Gandhi","Patel"], 0)],
  "GS": [Question("H2O?", ["Pani","Namak","Chini","O2"], 0), Question("Heart chambers?", ["4","2","3","5"], 0), Question("Light speed?", ["3 lakh km/s","1 lakh","5 lakh","2 lakh"], 0), Question("Gravity?", ["Newton","Einstein","Galileo","Tesla"], 0), Question("Vitamin C kami?", ["Scurvy","Rickets","Night blindness","Anemia"], 0)],
  "Mock Test": [Question("Mock Q1: 10+20=?", ["30","20","10","40"], 0), Question("Mock Q2: UP Police 2024?", ["GK","GS","Both","None"], 2)],
  "PYQ": [Question("PYQ 2024:...?", ["A","B","C","D"], 0)],
  "Current Affairs": [Question("Current 2025 PM?", ["Modi","Rahul","Yogi","None"], 0)],
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> items = [
      {"title":"Mock Test","sub":"150 Qs • Full Syllabus","icon":Icons.assignment,"color":Colors.orange,"count":150},
      {"title":"PYQ 2019-2024","sub":"Previous Year Papers","icon":Icons.history_edu,"color":Colors.blue,"count":500},
      {"title":"Maths","sub":"Arithmetic + Advance","icon":Icons.calculate,"color":Colors.green,"count":10},
      {"title":"Reasoning","sub":"Logical + Verbal","icon":Icons.lightbulb,"color":Colors.purple,"count":10},
      {"title":"Hindi","sub":"Vyakaran + Apathit","icon":Icons.menu_book,"color":Colors.red,"count":10},
      {"title":"GK / GS","sub":"UP Special + Science","icon":Icons.public,"color":Colors.teal,"count":20},
      {"title":"Current Affairs","sub":"Daily + Monthly PDF","icon":Icons.newspaper,"color":Colors.indigo,"count":10},
      {"title":"Daily Live Quiz","sub":"8 PM - Rank + Prize","icon":Icons.live_tv,"color":Colors.pink,"count":10, "live":true},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("MISSION VARDI 🇮🇳", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text("UP Police • Agniveer • SSC GD", style: TextStyle(fontSize: 11))
        ]),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none)), const CircleAvatar(radius: 16, backgroundColor: Colors.white, child: Text("H", style: TextStyle(color: Colors.orange))), const SizedBox(width: 10)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.orange.shade800, borderRadius: BorderRadius.circular(16)), child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Jai Hind! Aspirant 👋", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)), const SizedBox(height: 4), const Text("Aaj ka target pura karo", style: TextStyle(color: Colors.white70)), const SizedBox(height: 10), LinearProgressIndicator(value: 0.6, backgroundColor: Colors.white24, color: Colors.white, borderRadius: BorderRadius.circular(10))])), const SizedBox(width: 10), Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: const Column(children: [Text("60%", style: TextStyle(fontWeight: FontWeight.bold)), Text("Done", style: TextStyle(fontSize: 10))]))])),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.2),
            itemCount: items.length,
            itemBuilder: (context, i){
              final it = items[i];
              return GestureDetector(
                onTap: (){
                  String key = it['title'];
                  if(key=="GK / GS") key="GK";
                  if(key=="Mock Test" || key=="PYQ 2019-2024" || key=="Current Affairs" || key=="Daily Live Quiz") key="GK";
                  // For demo, open quiz
                  Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(category: it['title'], questions: qb[key]?? qb["GK"]!)));
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
                  padding: const EdgeInsets.all(14),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: (it['color'] as Color).withOpacity(0.15), borderRadius: BorderRadius.circular(10)), child: Icon(it['icon'], color: it['color'])),
                      if(it['live']==true) Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)), child: const Text("LIVE", style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)))
                    ]),
                    const Spacer(),
                    Text(it['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 2),
                    Text(it['sub'], style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Text("${it['count']} Questions", style: TextStyle(fontSize: 11, color: it['color'], fontWeight: FontWeight.bold)),
                  ]),
                ),
              );
            },
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed, selectedItemColor: Colors.orange.shade800, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "Rank"),
        BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: "PDF"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final String category; final List<Question> questions;
  const QuizScreen({super.key, required this.category, required this.questions});
  @override State<QuizScreen> createState() => _QuizScreenState();
}
class _QuizScreenState extends State<QuizScreen> {
  int current=0, score=0; bool answered=false; int? selected;
  void nextQ(){
    if(current < widget.questions.length-1){ setState((){current++; answered=false; selected=null;});}
    else{ showDialog(context: context, builder: (_)=> AlertDialog(title: Text("${widget.category} Complete!"), content: Text("Score: $score/${widget.questions.length}\nJai Hind!"), actions: [TextButton(onPressed: (){Navigator.pop(context); Navigator.pop(context);}, child: const Text("HOME"))]));}
  }
  @override
  Widget build(BuildContext context) {
    final q = widget.questions[current];
    return Scaffold(
      appBar: AppBar(title: Text("${widget.category} - ${current+1}/${widget.questions.length}"), backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        LinearProgressIndicator(value: (current+1)/widget.questions.length, color: Colors.orange),
        const SizedBox(height: 20),
        Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange)), child: Text(q.q, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
        const SizedBox(height: 20),
       ...List.generate(q.o.length, (i){
          Color col = Colors.white;
          if(answered){ if(i==q.ans) col=Colors.green.shade200; else if(i==selected && i!=q.ans) col=Colors.red.shade200;}
          return Container(margin: const EdgeInsets.only(bottom: 10), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: col, foregroundColor: Colors.black, padding: const EdgeInsets.all(14)), onPressed: answered? null : (){setState((){selected=i; answered=true;}); if(i==q.ans) score++;}, child: Text("${['A','B','C','D'][i]}. ${q.o[i]}")));
        }),
        const Spacer(),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, foregroundColor: Colors.white, padding: const EdgeInsets.all(16)), onPressed: answered? nextQ : null, child: Text(current==widget.questions.length-1? "FINISH":"NEXT")),
      ])),
    );
  }
}
