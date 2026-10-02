import 'package:flutter/material.dart';
void main() => runApp(const MissionVardiApp());
class MissionVardiApp extends StatelessWidget {
  const MissionVardiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('MISSION VARDI'), backgroundColor: Color(0xFF1B5E20), foregroundColor: Colors.white, centerTitle: true),
        body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.shield, size: 90, color: Color(0xFF1B5E20)),
          SizedBox(height: 20),
          Text('MISSION VARDI', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Text('Jai Hind! App Ready Hai'),
        ])),
      ),
    );
  }
}
