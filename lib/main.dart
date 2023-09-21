import 'package:flutter/material.dart';
import 'package:flutter_snapshoot/s_selected_wgt.dart';
import 'package:flutter_snapshoot/snapshoot.dart';
import 'package:get/get.dart';

import 's_selected_bean.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SSelectBean> beans = [];

  @override
  void initState() {
    // TODO: implement initState

    titleController = TextEditingController()..text = '';
    beans = [];
    List<String> namses = [
      '普通模板',
      '列表模板',
      '分组模板',
    ];
    namses.forEach((element) {
      beans.add(SSelectBean(name: element, select: false));
    });
    beans.first.select = true;

    super.initState();
  }

  TextEditingController controller = TextEditingController();
  TextEditingController titleController = TextEditingController();

  String _newValue = '';

  notesChange(newValue) {
    print(newValue);
    _newValue = newValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('模板'),
        ),
        body: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _leftWidget(),
                flex: 1,
              ),
              Expanded(
                child: _rightWidget(),
                flex: 2,
              )
            ],
          ),
        ));
  }

  String _showResString = '';

  @override
  Widget _leftWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SSelectWidget(
            beans: beans ?? [],
            callBack: (bean) {
              beans.forEach((element) {
                if (bean.name == element.name) {
                  element.select = true;
                } else {
                  element.select = false;
                }
              });
              print('bean =  =${bean.toString()}');
              if (mounted) {
                setState(() {});
              }
            },
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: TextField(
              minLines: 1,
              maxLines: 3,
              maxLength: 50,
              textInputAction: TextInputAction.done,
              controller: titleController,
              style: const TextStyle(color: Color(0xff222222)),
              onChanged: (newValue) => notesChange(newValue),
              onTap: () {},
              decoration: const InputDecoration(
                filled: true,
                hintText: '请输入文件标题',
                counterText: '',
                hintStyle: TextStyle(color: Color(0xffcccccc), fontSize: 16),
                fillColor: Color(0xfff8f8f8),
                border: InputBorder.none,
              ),
            ),
          ),
          CreateBtn(
              name: '生成数据',
              callback: () {
                if (mounted) {
                  setState(() {
                    _showResString = snapshoot.demoList(title: _newValue ?? '');
                    controller..text = _showResString;
                  });
                }
              }),
        ],
      ),
    );
  }

  @override
  Widget CreateBtn(
      {String? name, GestureTapCallback? callback, double? width}) {
    return Container(
      height: 40,
      width: width ?? 200,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: GestureDetector(
        onTap: callback,
        child: Center(
          child: Text(
            name ?? '',
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget _rowListView() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }

  @override
  Widget _rightWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.lightGreenAccent,
      child: TextField(
        minLines: 3,
        maxLines: 100,
        maxLength: 10000,
        textInputAction: TextInputAction.done,
        controller: controller,
        style: const TextStyle(color: Color(0xff222222)),
        onChanged: (newValue) => notesChange(newValue),
        onTap: () {},
        decoration: const InputDecoration(
          filled: true,
          hintText: '输出模板文件',
          counterText: '',
          hintStyle: TextStyle(color: Color(0xffcccccc), fontSize: 16),
          fillColor: Color(0xfff8f8f8),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
