import 'package:flutter/material.dart';

class VRShowError extends StatefulWidget {
  VRShowError({super.key, required this.title});

  String title;

  @override
  State<VRShowError> createState() => _VRShowErrorState();
}

class _VRShowErrorState extends State<VRShowError> {
  @override
  void initState() {
// TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Container());
  }
}
