
import 'package:flutter_snapshoot/time_stamp.dart';

class snapshoot{

  ///普通模板数据
  static String demo1({String ? title}){

    String time = TimeStamp().dateToString(TimeStamp().nowTimeToString());

    String s = 'import \'package\:flutter\/material.dart\';' +'\n'+
        '\n'+
        '\n'+
        '///''\n'+
        '/// @date:${time}''\n'+
        '/// @author:''\n'+
        '/// @des:''\n'+
            '///'
        '\n'+
    'class ${title} extends StatefulWidget {'+'\n'+
    '${title}({super.key, required this.title});'+'\n'+
        '\n'+
        'String title;'+'\n'+
    '@override'+'\n'+
    'State<${title}> createState() => _${title}State();'+'\n'+
    '}'+'\n'+
        '\n'+
    'class _${title}State extends State<${title}> {'+'\n'+
    '@override'+'\n'+
    'void initState() {'+'\n'+
    '// TODO: implement initState'+'\n'+
    'super.initState();'+'\n'+
    '}'+'\n'+
    '\n'+
    '@override'+'\n'+
    'Widget build(BuildContext context) {'+'\n'+
    'return Scaffold('+'\n'+
    'appBar: AppBar('+'\n'+
    'title: Text(\'\'),'+'\n'+
    '),'+'\n'+
    'body: Container());'+'\n'+
    '}'+'\n'+
    '}'+'\n';

    return s;
  }


  ///列表模板数据
  static String demoList({String ? title}){

    String time = TimeStamp().dateToString(TimeStamp().nowTimeToString());

    String s =
        'import \'dart:core\';'+'\n'+
    'import \'package:bruno/bruno.dart\';'+'\n'+
    'import \'package:dio/dio.dart\';'+'\n'+
    'import \'package:easy_refresh/easy_refresh.dart\';'+'\n'+
    'import \'package:flutter/material.dart\';'+'\n'+
    'import \'package:flutter/services.dart\';'+'\n'+
    'import \'../../../common/global/global_theme.dart\';'+'\n'+
    'import \'../../../common/request/request_url.dart\';'+'\n'+
    'import \'../../../utils/vr_request_utils.dart\';'+'\n'+
    '\n'+
        '\n'+
        '///''\n'+
        '/// @date:${time}''\n'+
        '/// @author:''\n'+
        '/// @des:''\n'+
        '///'
            '\n'+
    'class ${title} extends StatefulWidget {'+'\n'+
    '${title}();'+'\n'
            +'\n'+
    '@override'+'\n'+
    '_${title}State createState() => _${title}State();'+'\n'+
    '}'+'\n'
            +'\n'+
    'class _${title}State extends State<${title}> {'+'\n'+
    'late EasyRefreshController _controller;'+'\n'
            +'\n'
            +'\n'+
    '@override'+'\n'+
    'void initState() {'+'\n'+
    'request();'+'\n'+
    'super.initState();'+'\n'+
    '_controller = EasyRefreshController('+'\n'+
    'controlFinishLoad: true, controlFinishRefresh: true);'+'\n'+
    '}'+'\n'+
            '\n'+
    '///本地的数据信息'+'\n'+
    'late Widget _listWidget;'+'\n'+
    'List? _dataSource = [];'+'\n'+
    'bool _isLoad = false;'+'\n'+
    'int _page = 1;'+'\n'+
            '\n'+
    '@override'+'\n'+
    'Widget build(BuildContext context) {'+'\n'+
    'return _buildEmptyWidget();'+'\n'+
    '}'+'\n'+
            '\n'+
    'Widget _buildEmptyWidget() {'+'\n'+
    'return Column('+'\n'+
    'children: ['+'\n'+
    'Expanded('+'\n'+
    'flex: 1,'+'\n'+
    'child: MediaQuery.removePadding('+'\n'+
    'context: context,'+'\n'+
    'removeTop: true,'+'\n'+
    'child: Listener('+'\n'+
    'onPointerDown: (p) {'+'\n'+
    'if (!mounted) return;'+'\n'+
   'setState(() {'+'\n'+
    '_isLoad = true;'+'\n'+
    '});'+'\n'+
    '},'+'\n'+
    'child: _easyRefresh()),'+'\n'+
    '),'+'\n'+
    '),'+'\n'+
    '],'+'\n'+
    ');'+'\n'+
    '}'+'\n'
            +'\n'+
    'Widget _easyRefresh() {'+'\n'+
    'if (_dataSource?.length == 0) {'+'\n'+
    '_listWidget = EasyRefresh('+'\n'+
    'header: GlobalTheme().classicHeader,'+'\n'+
    'footer: GlobalTheme().classicFooter,'+'\n'+
    'onRefresh: () async {'+'\n'+
    '_page = 1;'+'\n'+
    'request();'+'\n'+
    '},'+'\n'+
    'child: SingleChildScrollView('+'\n'+
    'child: Container('+'\n'+
    'height: 500,'+'\n'+
    'child: Center('+'\n'+
    'child: BrnAbnormalStateWidget('+'\n'+
    'enablePageTap: true,'+'\n'+
    'isCenterVertical: true,'+'\n'+
    'img: Image.asset('+'\n'+
    '\'images/emptystate.png\','+'\n'+
    'scale: 3.0,'+'\n'+
    '),'+'\n'+
    'title: \'暂无房源数据，快去拍摄吧～\','+'\n'+
    'themeData: BrnAbnormalStateConfig('+'\n'+
    'titleTextStyle:'+'\n'+
    'BrnTextStyle(color: Color(0xFF999999), fontSize: 14)),'+'\n'+
    'action: (index) {'+'\n'+
            '\n'+
    '},'+'\n'+
    '),'+'\n'+
    '),'+'\n'+
    '),'+'\n'+
    '),'+'\n'+
    ');'+'\n'+
    '} else {'+'\n'+
    '_listWidget = EasyRefresh('+'\n'+
    'header: GlobalTheme().classicHeader,'+'\n'+
    'footer: GlobalTheme().classicFooter,'+'\n'+
    'onRefresh: () async {'+'\n'+
    '_page = 1;'+'\n'+
    'request();'+'\n'+
    '_controller.finishRefresh(IndicatorResult.success);'+'\n'+
    '},'+'\n'+
    'onLoad: () async {'+'\n'+
    'await Future.delayed(Duration(seconds: 0), () {'+'\n'+
    'if (_isLoad) {'+'\n'+
    '_isLoad = false;'+'\n'+
    'if (mounted) {'+'\n'+
    'setState(() {'+'\n'+
    '_page += 1;'+'\n'+
    '});'+'\n'+
    '}'+'\n'+
    'request();'+'\n'+
    '///判断数据源来源 接口返回和本地数据'+'\n'+
    'if ((_dataSource?.length ?? 0) >= (_xxxxxCount?.listCount ?? 0) &&'+'\n'+
    '(_dataSource?.length != 0)) {'+'\n'+
    '_controller.finishLoad(IndicatorResult.noMore);'+'\n'+
    '}'+'\n'+
    '} else {'+'\n'+
    '_controller.finishLoad(IndicatorResult.none);'+'\n'+
    '}'+'\n'+
    '});'+'\n'+
    '},'+'\n'+
    'child: ListView.builder('+'\n'+
    'itemCount: _dataSource?.length ?? 0,'+'\n'+
    'addRepaintBoundaries: false,'+'\n'+
    'addAutomaticKeepAlives: false,'+'\n'+
    'itemBuilder: (context, index) {'+'\n'+
    'return _buildCard(bean: _dataSource?[index]);'+'\n'+
    '}),'+'\n'+
    ');'+'\n'+
    '}'+'\n'+
    'return Column('+'\n'+
    'children: ['+'\n'+
    'Expanded('+'\n'+
    'child: MediaQuery.removePadding('+'\n'+
    'context: context,'+'\n'+
    'removeTop: true,'+'\n'+
    'child: _listWidget,'+'\n'+
    '),'+'\n'+
    '),'+'\n'+
    '],'+'\n'+
    ');'+'\n'+
    '}'+'\n'
            +'\n'+
    'void request() {'+'\n'+
    '///判断返回的数据源和本地数据源信息'+'\n'+
    '// if (page != 1) {'+'\n'+
    '//   if ((_dataSource?.length ?? 0) >= (resultTotle?.listCount ?? 0)) {'+'\n'+
    '//     return;'+'\n'+
    '//   }'+'\n'+
    '// }'+'\n'+
    'Map<String, dynamic> params = {'+'\n'+
    '\'page\': _page,'+'\n'+
    '\'pageSize\': \'10\''+'\n'+
    '};'+'\n'+
            '\n'+
    'VRDioUtil.instance?.request(RequestUrl.VR_XXXXXXX, params: params).then((value) {'+'\n'+
    'if (mounted) {'+'\n'+
    'setState(() {});'+'\n'+
    '}'+'\n'+
    '});'+'\n'+
    '}'+'\n'
            +'\n'+
    '///此处数据源 最佳实践 需要替换为具体的模型'+'\n'+
    '@override'+'\n'+
    'Widget _buildCard({var bean}) {'+'\n'+
    '///卡片信息'+'\n'+
    'return Container('+'\n'+
    'color: Colors.red,'+'\n'+
    ');'+'\n'+
    '}'+'\n'
            +'\n'+
    '@override'+'\n'+
    'void deactivate() {'+'\n'+
    'super.deactivate();'+'\n'+
    '}'+'\n'+
            '\n'+
    '@override'+'\n'+
    'void dispose() {'+'\n'+
    '// TODO: implement dispose'+'\n'+
    'super.dispose();'+'\n'+
    '}'+'\n'+
    '}';
    return s;
  }
}