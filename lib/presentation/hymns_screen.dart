import 'package:flutter/material.dart';
import 'package:lagu_sion/data/hyms.dart';

class HymnScreen extends StatefulWidget {
  Hys hys;
  HymnScreen({Key? key, required this.hys}) : super(key: key);

  @override
  State<HymnScreen> createState() => _HymnScreenState();
}

class _HymnScreenState extends State<HymnScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.hys.title.toString()),
      ),
      body: Center(
        child: Text(widget.hys.lyrics.toString()),
      ),
    ));
  }
}
