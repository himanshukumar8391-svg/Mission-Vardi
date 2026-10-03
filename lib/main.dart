import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MissionVardiApp());

class MissionVardiApp extends StatelessWidget {
  const MissionVardiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mission Vardi',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}

class Question {
  final String q; final List<String> o; final int ans;
  Question(this.q, this.o, this.ans);
}

final Map<String, List<Question>> qb = {
  "MATHS": [
    Question("10, 20, 30 का औसत क्या होगा?", ["15","20","30","10"], 1),
    Question("100 का 20% कितना होगा?", ["20","30","10","25"], 0),
    Question("15 x 12 का मान?", ["180","150","170","200"], 0),
    Question("√64 का मान क्या है?", ["6","7","8","9"], 2),
    Question("1 किमी में कितने मीटर?", ["100","1000","10000","500"], 1),
    Question("2 घंटे में कितने सेकंड?", ["3600","7200","1800","5400"], 1),
    Question("360 का 10% कितना?", ["36","30","40","26"], 0),
    Question("12 का वर्ग क्या है?", ["144","124","134","154"], 0),
  ],
  "GK": [
    Question("भारत की राजधानी क्या है?", ["Mumbai","Delhi","Kolkata","Chennai"], 1),
    Question("तिरंगे में कितने रंग होते हैं?", ["2","3","4","5"], 1),
    Question("पुलिस का हेल्पलाइन नंबर?", ["100","101","102","108"], 0),
  ],
  "REASONING": [
    Question("A, B, C में A बड़ा है B से, B बड़ा है C से तो सबसे बड़ा कौन?", ["A","B","C","सभी"], 0),
    Question("5, 10, 15, अगला?", ["20","25","30","35"], 0),
  ],
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mission Vardi 🇮🇳"), centerTitle: true, backgroundColor: Colors.indigo),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              Text("जय हिन्द! 🇮🇳", style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Police Exam की तैयारी शुरू करें", style: TextStyle(fontSize: 16)),
            ]),
          ),
          const SizedBox(height: 20),
         ...qb.keys.map((subject) => Card(
            child: ListTile(
              leading: const Icon(Icons.shield, color: Colors.indigo),
              title: Text(subject, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${qb[subject]!.length} Questions"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(subject: subject))),
            ),
          )),
        ],
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final String subject;
  const QuizScreen({super.key, required this.subject});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int idx = 0; int score = 0;
  @override
  Widget build(BuildContext context) {
    final questions = qb[widget.subject]!;
    final q = questions[idx];
    return Scaffold(
      appBar: AppBar(title: Text("${widget.subject} - ${idx+1}/${questions.length}"), backgroundColor: Colors.indigo),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          LinearProgressIndicator(value: (idx+1)/questions.length),
          const SizedBox(height: 20),
          Text(q.q, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
         ...List.generate(q.o.length, (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16), backgroundColor: Colors.white, foregroundColor: Colors.black, side: const BorderSide(color: Colors.indigo)),
              onPressed: () {
                if (i == q.ans) score++;
                if (idx < questions.length - 1) {
                  setState(() => idx++);
                } else {
                  showDialog(context: context, builder: (_) => AlertDialog(
                    title: const Text("Result"),
                    content: Text("Score: $score / ${questions.length}\nशाबाश!"),
                    actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text("OK"))],
                  ));
                }
              },
              child: Text(q.o[i], style: const TextStyle(fontSize: 16)),
            ),
          )),
        ]),
      ),
    );
  }
}
