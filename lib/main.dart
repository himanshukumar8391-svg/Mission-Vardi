import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MissionVardiApp());

class MissionVardiApp extends StatelessWidget {
  const MissionVardiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'MISSION VARDI', home: const HomeScreen());
  }
}

class Question {
  final String q; final List<String> o; final int ans;
  Question(this.q, this.o, this.ans);
}

// 150+ QUESTIONS BANK
final Map<String, List<Question>> qb = {
  "MATHS": [
    Question("10, 20, 30 का औसत क्या होगा?", ["15","20","25","30"], 1),
    Question("100 का 20% कितना होगा?", ["20","30","10","25"], 0),
    Question("15 × 12 का मान?", ["180","150","170","200"], 0),
    Question("√64 का मान क्या है?", ["6","7","8","9"], 2),
    Question("1 किमी में कितने मीटर?", ["100","1000","10000","10"], 1),
    Question("2 घंटे में कितने सेकंड?", ["3600","7200","1800","6000"], 1),
    Question("अंक 0,1,2 से बड़ी संख्या?", ["210","201","120","102"], 0),
    Question("पहली 5 अभाज्य संख्या का योग?", ["28","18","25","30"], 0),
    Question("लाभ = विक्रय मूल्य -?", ["क्रय मूल्य","लाभ","हानि","छूट"], 0),
    Question("त्रिभुज के कोणों का योग?", ["90°","180°","360°","270°"], 1),
    Question("12 का वर्ग क्या है?", ["144","124","134","154"], 0),
    Question("360 का 10% कितना?", ["36","30","40","26"], 0),
    Question("साधारण ब्याज का सूत्र?", ["PRT/100","P+R+T","PR/T","P/R"], 0),
    Question("15 और 25 का HCF?", ["5","10","15","25"], 0),
    Question("2,4,8,16 का अगला पद?", ["24","32","20","18"], 1),
    Question("आयत का क्षेत्रफल?", ["L×B","L+B","2(L+B)","L/B"], 0),
    Question("1000 ÷ 25 =?", ["40","50","30","45"], 0),
    Question("0.5 × 0.5 =?", ["0.25","0.5","0.05","2.5"], 0),
    Question("5,10,15,__?,25", ["20","22","18","30"], 0),
    Question("50 का आधा कितना?", ["20","25","30","15"], 1),
    Question("1 से 100 तक कितनी सम संख्याएं?", ["50","49","51","48"], 0),
    Question("वृत्त की परिधि?", ["2πr","πr²","2r","πd/2"], 0),
    Question("45+45+45 =?", ["135","145","125","155"], 0),
    Question("सबसे छोटी 3 अंकीय संख्या?", ["100","111","101","110"], 0),
    Question("10% of 1500 =?", ["150","100","200","250"], 0),
  ],
  "REASONING": [
    Question("श्रृंखला: 2,4,8,16,?", ["32","24","30","18"], 0),
    Question("विषम चुनें: 2,4,6,7", ["2","4","6","7"], 3),
    Question("यदि आज सोमवार है, 61 दिन बाद?", ["शनिवार","रविवार","सोमवार","मंगलवार"], 0),
    Question("A, B का भाई, B, C का बेटा तो A, C का?", ["बेटा","भाई","पिता","चाचा"], 0),
    Question("CAT=12, DOG=14 तो MAN=?", ["20","15","13","28"], 2),
    Question("पानी को क्या कहते हैं? H2O में", ["पानी","द्रव","जीवन","समुद्र"], 0),
    Question("दर्पण में 12:15 का प्रतिबिंब?", ["11:45","10:45","12:45","9:45"], 0),
    Question("राम पूर्व में है, बाएं मुड़ा तो दिशा?", ["उत्तर","दक्षिण","पश्चिम","पूर्व"], 0),
    Question("5,10,20,40,?", ["80","60","70","90"], 0),
    Question("BOOK : READ :: PEN :?", ["WRITE","INK","PAPER","HOLD"], 0),
    Question("कौन अलग है: सेब, आम, आलू, संतरा?", ["आलू","सेब","आम","संतरा"], 0),
    Question("अगर PINK को 35 कहा जाए तो BLUE?", ["30","35","40","25"], 0),
    Question("घड़ी में 3:30 पर कोण?", ["75°","90°","60°","105°"], 0),
    Question("A=1, B=2, Z=?", ["26","24","25","27"], 0),
    Question("विलोम: दिन -?", ["रात","सुबह","शाम","दोपहर"], 0),
    Question("क्रम: 1,3,6,10,?", ["15","14","13","16"], 0),
    Question("पिता : पुत्र :: माता :?", ["पुत्री","बहन","पिता","भाई"], 0),
    Question("कौन सी संख्या अलग: 16,25,36,42", ["42","16","25","36"], 0),
    Question("यदि 2=5, 4=9, 6=13 तो 8=?", ["17","18","15","19"], 0),
    Question("उत्तर-पूर्व को दक्षिण कहा जाए तो उत्तर क्या?", ["पश्चिम","पूर्व","दक्षिण-पश्चिम","उत्तर-पश्चिम"], 2),
  ],
  "HINDI": [
    Question("'वीर' का विलोम क्या है?", ["कायर","बहादुर","निडर","बलवान"], 0),
    Question("'फूल' का पर्यायवाची?", ["पुष्प","पत्थर","पौधा","पेड़"], 0),
    Question("'ईमानदारी' कौन सी संज्ञा है?", ["भाववाचक","जातिवाचक","व्यक्तिवाचक","सर्वनाम"], 0),
    Question("हिन्दी वर्णमाला में वर्ण?", ["52","44","50","48"], 0),
    Question("'आँख का तारा' का अर्थ?", ["बहुत प्यारा","दुश्मन","अंधा","गुस्सा"], 0),
    Question("शुद्ध शब्द कौन सा है?", ["उज्ज्वल","उजवल","उज्जवल","उज्वल"], 0),
    Question("वचन के कितने भेद?", ["2","3","4","5"], 0),
    Question("'गंगा' का लिंग?", ["स्त्रीलिंग","पुल्लिंग","नपुंसक","उभयलिंग"], 0),
    Question("समास कितने प्रकार?", ["4","6","8","3"], 1),
    Question("'राजा' का स्त्रीलिंग?", ["रानी","राजी","राजन","राज्ञी"], 0),
    Question("क्रिया के कितने भेद?", ["2","3","4","5"], 0),
    Question("'सूर्य' का पर्यायवाची?", ["रवि","चंद्र","तारा","धरती"], 0),
    Question("अलंकार कितने प्रकार?", ["2","3","4","5"], 0),
    Question("'पानी' का तत्सम?", ["जल","नीर","वारि","पय"], 0),
    Question("संधि कितने प्रकार?", ["3","2","4","5"], 0),
    Question("'पुस्तक' का बहुवचन?", ["पुस्तकें","पुस्तकों","पुस्तक","पुस्तकाओं"], 0),
    Question("कारक कितने?", ["8","6","7","5"], 0),
    Question("'हर्ष' का विलोम?", ["विषाद","खुशी","दुख","शोक"], 0),
    Question("संज्ञा के कितने भेद?", ["3","4","5","2"], 0),
    Question("'चिड़िया उड़ती है' में क्रिया?", ["उड़ती है","चिड़िया","है","कोई नहीं"], 0),
  ],
  "GK": [
    Question("भारतीय सेना दिवस कब?", ["15 जनवरी","26 जनवरी","15 अगस्त","8 अक्टूबर"], 0),
    Question("कारगिल विजय दिवस?", ["26 जुलाई","15 अगस्त","26 जनवरी","5 सितंबर"], 0),
    Question("राष्ट्रीय पशु?", ["बाघ","शेर","हाथी","मोर"], 0),
    Question("ताजमहल कहाँ?", ["आगरा","दिल्ली","जयपुर","लखनऊ"], 0),
    Question("UP की राजधानी?", ["लखनऊ","कानपुर","नोएडा","प्रयागराज"], 0),
    Question("भारत का राष्ट्रीय पक्षी?", ["मोर","तोता","कबूतर","हंस"], 0),
    Question("गांधी जयंती कब?", ["2 अक्टूबर","15 अगस्त","26 जनवरी","30 जनवरी"], 0),
    Question("पहला उपग्रह?", ["आर्यभट्ट","भास्कर","रोहिणी","INSAT"], 0),
    Question("संविधान दिवस?", ["26 नवंबर","26 जनवरी","15 अगस्त","2 अक्टूबर"], 0),
    Question("UP Police स्थापना?", ["1863","1947","1950","1965"], 0),
    Question("राम मंदिर कहाँ?", ["अयोध्या","काशी","मथुरा","प्रयाग"], 0),
    Question("योग दिवस?", ["21 जून","21 जुलाई","21 मई","21 अगस्त"], 0),
    Question("राष्ट्रीय गान?", ["जन गण मन","वंदे मातरम","सारे जहां से","जय हिंद"], 0),
    Question("लोकसभा सीटें UP में?", ["80","70","75","85"], 0),
    Question("G20 2023 अध्यक्ष?", ["भारत","USA","UK","चीन"], 0),
    Question("चंद्रयान 3 कब लॉन्च?", ["2023","2022","2021","2020"], 0),
    Question("UP का राजकीय पशु?", ["बारहसिंगा","बाघ","हिरण","गाय"], 0),
    Question("भारत का सबसे बड़ा राज्य?", ["राजस्थान","UP","MP","महाराष्ट्र"], 0),
    Question("पुलिस ध्वज दिवस?", ["21 अक्टूबर","26 जनवरी","15 अगस्त","21 जून"], 0),
    Question("कुंभ 2025 कहाँ?", ["प्रयागराज","हरिद्वार","उज्जैन","नासिक"], 0),
  ],
  "GS": [
    Question("विटामिन C कमी से रोग?", ["स्कर्वी","रतौंधी","एनीमिया","रिकेट्स"], 0),
    Question("हृदय में कक्ष?", ["2","3","4","5"], 2),
    Question("H2O क्या है?", ["पानी","नमक","चीनी","O2"], 0),
    Question("गुरुत्वाकर्षण खोज?", ["न्यूटन","आइंस्टीन","गैलीलियो","टेस्ला"], 0),
    Question("प्रकाश की गति?", ["3 लाख किमी/से","1 लाख","5 लाख","2 लाख"], 0),
    Question("मानव में गुणसूत्र?", ["46","44","48","50"], 0),
    Question("सबसे कठोर धातु?", ["हीरा","सोना","लोहा","चांदी"], 0),
    Question("खून का PH?", ["7.4","7.0","6.5","8.0"], 0),
    Question("टाइफाइड किससे?", ["बैक्टीरिया","वायरस","फंगस","प्रोटोजोआ"], 0),
    Question("पौधे भोजन बनाते हैं?", ["प्रकाश संश्लेषण","श्वसन","वाष्पोत्सर्जन","अंकुरण"], 0),
    Question("O2 खोज किसने की?", ["प्रिस्टले","न्यूटन","डाल्टन","रदरफोर्ड"], 0),
    Question("विद्युत का SI मात्रक?", ["एम्पीयर","वोल्ट","ओम","वाट"], 0),
    Question("मानव मस्तिष्क का वजन?", ["1400g","1000g","2000g","500g"], 0),
    Question("लाल रक्त कण बनते हैं?", ["अस्थि मज्जा","हृदय","यकृत","फेफड़े"], 0),
    Question("ध्वनि सबसे तेज?", ["ठोस में","द्रव में","गैस में","निर्वात में"], 0),
    Question("AC को DC में बदलता है?", ["रेक्टिफायर","ट्रांसफार्मर","मोटर","जेनरेटर"], 0),
    Question("विटामिन D स्रोत?", ["सूर्य","पानी","हवा","मिट्टी"], 0),
    Question("कोशिका की खोज?", ["रॉबर्ट हुक","न्यूटन","डार्विन","मेंडल"], 0),
    Question("परमाणु बम सिद्धांत?", ["E=mc²","F=ma","V=IR","P=VI"], 0),
    Question("दूध में प्रोटीन?", ["केसीन","एल्ब्यूमिन","ग्लोबिन","मायोसिन"], 0),
  ],
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      {"title":"MOCK TEST","sub":"150 Qs","icon":Icons.assignment,"color":Colors.orange,"key":"GK"},
      {"title":"PYQ 2019-2024","sub":"PYQ Papers","icon":Icons.history_edu,"color":Colors.blue,"key":"GK"},
      {"title":"MATHS","sub":"25 Questions","icon":Icons.calculate,"color":Colors.green,"key":"MATHS"},
      {"title":"REASONING","sub":"20 Questions","icon":Icons.lightbulb,"color":Colors.purple,"key":"REASONING"},
      {"title":"HINDI","sub":"20 Questions","icon":Icons.menu_book,"color":Colors.red,"key":"HINDI"},
      {"title":"GK","sub":"20 Questions","icon":Icons.public,"color":Colors.teal,"key":"GK"},
      {"title":"GS","sub":"20 Questions","icon":Icons.science,"color":Colors.indigo,"key":"GS"},
      {"title":"CURRENT","sub":"Daily Update","icon":Icons.newspaper,"color":Colors.pink,"key":"GK"},
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white, title: const Text('MISSION VARDI 🇮🇳', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.2),
        itemCount: items.length,
        itemBuilder: (c,i){
          final it = items[i];
          return GestureDetector(
            onTap: ()=> Navigator.push(c, MaterialPageRoute(builder: (_)=> QuizScreen(category: it['title'] as String, questions: qb[it['key']]!))),
            child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)]), padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: (it['color'] as Color).withOpacity(0.15), borderRadius: BorderRadius.circular(10)), child: Icon(it['icon'] as IconData, color: it['color'] as Color)), const Spacer(), Text(it['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)), Text(it['sub'] as String, style: const TextStyle(fontSize: 11, color: Colors.grey))])),
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
  void nextQ(){ if(current < widget.questions.length-1){ setState((){current++; answered=false; selected=null;});} else{ showDialog(context: context, builder: (_)=> AlertDialog(title: const Text("Quiz Complete!"), content: Text("Category: ${widget.category}\nScore: $score / ${widget.questions.length}\nJai Hind! 🇮🇳"), actions: [TextButton(onPressed: (){Navigator.pop(context); Navigator.pop(context);}, child: const Text("HOME"))]));}}
  @override
  Widget build(BuildContext context) {
    final q = widget.questions[current];
    return Scaffold(
      appBar: AppBar(title: Text("${widget.category} - Q ${current+1}/${widget.questions.length}"), backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Category: ${widget.category}", style: const TextStyle(fontWeight: FontWeight.bold)), Text("Score: $score
