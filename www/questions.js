// QUESTIONS DATABASE
// s = subject (hindi | gk | math | reason), t = topic (must match topic name in index.html)
// y = exam year for Previous Year Questions (e.g. 2023), or 0 for normal practice question
// q = question (Hindi), o = 4 options (Hindi), a = correct option index (0-3), e = short explanation
// To add more questions, copy a block below and paste it before the closing ];
const Q=[
{s:"hindi",t:"Synonyms",y:0,q:"'सूर्य' का पर्यायवाची शब्द कौन-सा है?",o:["दिनकर","शशि","जलद","पवन"],a:0,e:"Dinkar = Sun"},
{s:"hindi",t:"Antonyms",y:0,q:"'अंधकार' का विलोम शब्द क्या है?",o:["प्रकाश","तम","रात्रि","निशा"],a:0,e:"Opposite of darkness is light"},
{s:"hindi",t:"Samas",y:0,q:"'नीलकंठ' में कौन-सा समास है?",o:["तत्पुरुष","बहुव्रीहि","द्वंद्व","कर्मधारय"],a:1,e:"Neelkanth means Shiva, so Bahuvrihi"},
{s:"hindi",t:"Sandhi",y:0,q:"'विद्यालय' का संधि-विच्छेद क्या है?",o:["विद्या + आलय","विद्य + आलय","विद्या + लय","विद्य + अलय"],a:0,e:"Deergh Swar Sandhi"},
{s:"hindi",t:"One-word Substitution",y:0,q:"'जो ईश्वर में विश्वास करता है' के लिए एक शब्द क्या है?",o:["नास्तिक","आस्तिक","भक्त","साधु"],a:1,e:"Aastik"},
{s:"gk",t:"Polity",y:0,q:"भारत का संविधान कब लागू हुआ?",o:["15 अगस्त 1947","26 नवंबर 1949","26 जनवरी 1950","2 अक्टूबर 1950"],a:2,e:"Constitution came into force on 26 Jan 1950"},
{s:"gk",t:"UP GK",y:0,q:"उत्तर प्रदेश में कुल कितने मंडल हैं?",o:["15","17","18","20"],a:2,e:"UP has 18 divisions"},
{s:"gk",t:"Geography",y:0,q:"भारत में बहने वाली सबसे लंबी नदी कौन-सी है?",o:["गंगा","यमुना","गोदावरी","ब्रह्मपुत्र"],a:0,e:"Ganga is the longest river within India"},
{s:"gk",t:"History",y:0,q:"1857 की क्रांति की शुरुआत कहाँ से हुई?",o:["कानपुर","मेरठ","झाँसी","लखनऊ"],a:1,e:"Started at Meerut on 10 May 1857"},
{s:"gk",t:"Science",y:0,q:"मानव शरीर की सबसे बड़ी ग्रंथि कौन-सी है?",o:["अग्न्याशय","यकृत","थायराइड","पीयूष ग्रंथि"],a:1,e:"Liver is the largest gland"},
{s:"math",t:"Percentage",y:0,q:"480 का 25% कितना होता है?",o:["100","110","120","130"],a:2,e:"480 x 25/100 = 120"},
{s:"math",t:"Speed-Distance",y:0,q:"एक ट्रेन 60 किमी/घंटा की चाल से 3 घंटे में कितनी दूरी तय करेगी?",o:["120 किमी","150 किमी","180 किमी","200 किमी"],a:2,e:"Distance = 60 x 3 = 180"},
{s:"math",t:"LCM-HCF",y:0,q:"12 और 18 का ल.स.प. (LCM) क्या है?",o:["24","36","48","72"],a:1,e:"LCM(12,18) = 36"},
{s:"math",t:"Interest",y:0,q:"₹1000 का 10% वार्षिक दर से 2 वर्ष का साधारण ब्याज कितना होगा?",o:["₹100","₹200","₹210","₹220"],a:1,e:"SI = 1000 x 10 x 2 / 100 = 200"},
{s:"math",t:"Average",y:0,q:"10, 20, 30, 40, 50 का औसत क्या है?",o:["25","30","35","40"],a:1,e:"150 / 5 = 30"},
{s:"reason",t:"Series",y:0,q:"श्रृंखला पूरी कीजिए: 2, 4, 8, 16, ?",o:["24","30","32","64"],a:2,e:"Each term is doubled"},
{s:"reason",t:"Coding-Decoding",y:0,q:"यदि CAT = DBU है, तो DOG = ?",o:["EPH","EOH","DPH","FPI"],a:0,e:"Each letter moves +1"},
{s:"reason",t:"Direction",y:0,q:"राम पूर्व की ओर मुँह करके खड़ा है। वह दाएँ मुड़ता है। अब उसका मुँह किस दिशा में है?",o:["उत्तर","दक्षिण","पश्चिम","पूर्व"],a:1,e:"Right turn from East = South"},
{s:"reason",t:"Odd One Out",y:0,q:"विषम चुनिए: सेब, आम, केला, गाजर",o:["सेब","आम","केला","गाजर"],a:3,e:"Carrot is a vegetable"},
{s:"reason",t:"Blood Relations",y:0,q:"मेरे पिता के पिता के इकलौते पुत्र की पत्नी मेरी क्या लगती है?",o:["माँ","दादी","चाची","बुआ"],a:0,e:"Father's father's only son = my father, his wife = my mother"}
];
