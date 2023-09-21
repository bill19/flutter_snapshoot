import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 's_selected_bean.dart';

typedef SelectCallBack = void Function(SSelectBean bean);

class SSelectWidget extends StatefulWidget {
  SSelectWidget({super.key, required this.beans, this.callBack});

  List<SSelectBean> beans;

  SelectCallBack? callBack;

  @override
  State<SSelectWidget> createState() => _SSelectState();
}

class _SSelectState extends State<SSelectWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets(),
      ),
    );
  }

  List<Widget> widgets() {
    List<Widget> widgets = [];
    for (SSelectBean o in widget.beans) {
      widgets.add(Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          borderRadius: BorderRadius.circular(6),
        ),
        width: 60,
        height: 40,
        child: GestureDetector(
          onTap: () {
            if (widget.callBack != null) {
              widget.callBack!(o);
            }
          },
          child: Center(
            child: Text(
              o.name ?? '',
              style: TextStyle(
                  color: (o.select ?? false) ? Colors.lightBlue : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ));
    }
    return widgets;
  }
}
