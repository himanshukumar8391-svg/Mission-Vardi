import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MissionVardiApp());

class MissionVardiApp extends StatelessWidget {
  const MissionVardiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MISSION VARDI',
      theme: ThemeData(primarySwatch: Colors.orange),
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
    Question("10, 20, 30 का औसत क्या होगा?", ["15", "20", "25", "30"], 1),
    Question("100 का 20% कितना होगा?", ["20", "30", "10", "25"], 0),
    Question("15 × 12 का मान?", ["180", "150", "170", "200"], 0),
    Question("√64 का मान क्या है?", ["6", "7", "8", "9"], 2),
    Question("5% of 200 =?", ["10", "20", "15", "5"], 0),
  ],
  "REASONING": [
    Question("श्रृंखला पूरी करें: 2, 4, 8, 16,?", ["24", "32", "30", "20"], 1),
    Question("विषम चुनें: 2, 4, 6, 7", ["2", "4", "6", "7"], 3),
    Question("यदि आज सोमवार है, तो 61 दिन बाद कौन सा दिन होगा?", ["शनिवार", "रविवार", "सोमवार", "मंगलवार"], 0),
    Question("मेरी माँ के बेटे का तुमसे क्या रिश्ता?", ["भाई", "पिता", "चाचा", "मामा"], 0),
  ],
  "HINDI": [
    Question("'वीर' का विलोम शब्द क्या है?", ["कायर", "बहादुर", "निडर", "बलवान"], 0),
    Question("'फूल' का पर्यायवाची शब्द है?", ["पुष्प", "पत्थर", "पौधा", "पेड़"], 0),
    Question("'ईमानदारी' कौन सी संज्ञा है?", ["भाववाचक", "जातिवाचक", "व्यक्तिवाचक", "सर्वनाम"], 0),
    Question("'आँख का तारा' मुहावरे का अर्थ है?", ["बहुत प्यारा", "दुश्मन", "अंधा", "गुस्सा"], 0),
    Question("शुद्ध शब्द कौन सा है?", ["उज्ज्वल", "उजवल", "उज्जवल", "उज्वल"], 0),
  ],
  "GK": [
    Question("भारतीय सेना दिवस कब मनाया जाता है?", ["15 जनवरी", "26 जनवरी", "15 अगस्त", "8 अक्टूबर"], 0),
    Question("कारगिल विजय दिवस कब है?", ["26 जुलाई", "15 अगस्त", "26 जनवरी", "5 सितम्बर"], 0),
    Question("ताजमहल कहाँ स्थित है?", ["आगरा", "दिल्ली", "जयपुर", "लखनऊ"], 0),
    Question("भारत का राष्ट्रीय पशु कौन है?", ["बाघ", "शेर", "हाथी", "मोर"], 0),
  ],
  "GS": [
    Question("विटामिन C की कमी से कौन सा रोग होता है?", ["स्कर्वी", "रतौंधी", "एनीमिया", "रickets"], 0),
    Question("मानव हृदय में कितने कक्ष होते हैं?", ["2", "3", "4", "5"], 2),
    Question("प्रकाश की गति कितनी है?", ["3 लाख किमी/से", "1 लाख", "5 लाख", "2 लाख"], 0),
    Question("H2O क्या है?", ["पानी", "नमक", "चीनी", "ऑक्सीजन"], 0),
  ],
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      {"title":"MATHS","icon":Icons.calculate,"color":Colors.green},
      {"title":"REASONING","icon":Icons.lightbulb,"color":Colors.purple},
      {"title":"HINDI","icon":Icons.menu_book,"color":Colors.red},
      {"title":"GK","icon":Icons.public,"color":Colors.teal},
      {"title":"GS","icon":Icons.science,"color":Colors.orange},
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('MISSION VARDI 🇮🇳', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white, centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.3),
        itemCount: items.length,
        itemBuilder: (c,i){
          final it = items[i];
          return GestureDetector(
            onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => QuizScreen(category: it['title'] as String, questions: qb[it['title']]!))),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Icon(it['icon'] as IconData, size: 40, color: it['color'] as Color),
                const SizedBox(height: 10),
                Text(it['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("${qb[it['title']]!.length} Questions", style: const TextStyle(color: Colors.grey)),
              ]),
            ),
          );
        },
      ),
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
    else{ showDialog(context: context, builder: (_)=> AlertDialog(title: const Text("Quiz Complete!"), content: Text("Score: $score / ${widget.questions.length}\nJai Hind! 🇮🇳"), actions: [TextButton(onPressed: (){Navigator.pop(context); Navigator.pop(context);}, child: const Text("HOME"))]));}
  }
  @override
  Widget build(BuildContext context) {
    final q = widget.questions[current];
    return Scaffold(
      appBar: AppBar(title: Text("${widget.category} - Q ${current+1}/${widget.questions.length}"), backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // English UI
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Category: ${widget.category}", style: const TextStyle(fontWeight: FontWeight.bold)), Text("Score: $score", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade700))]),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: (current+1)/widget.questions.length, color: Colors.orange),
        const SizedBox(height: 20),
        // HINDI FONT ONLY FOR QUESTION
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange)),
          child: Text(q.q, style: GoogleFonts.mukta(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black)), // <-- Hindi font yaha
        ),
        const SizedBox(height: 20),
      ...List.generate(q.o.length, (i){
          Color col = Colors.white;
          if(answered){ if(i==q.ans) col=Colors.green.shade200; else if(i==selected && i!=q.ans) col=Colors.red.shade200;}
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: col, foregroundColor: Colors.black, padding: const EdgeInsets.all(14)),
              onPressed: answered? null : (){setState((){selected=i; answered=true;}); if(i==q.ans) score++;},
              // Option A,B,C,D English, but content Hindi font
              child: Align(alignment: Alignment.centerLeft, child: Text("${['A','B','C','D'][i]}. ${q.o[i]}", style: GoogleFonts.mukta(fontSize: 18, fontWeight: FontWeight.w500))),
            ),
          );
        }),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, foregroundColor: Colors.white, padding: const EdgeInsets.all(16)),
          onPressed: answered? nextQ : null,
          child: Text(current==widget.questions.length-1? "FINISH" : "NEXT", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // English UI
        ),
      ])),
    );
  }
}
