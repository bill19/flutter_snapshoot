import 'package:date_format/date_format.dart';

class TimeStamp {
  String getNowAppointmentTime() {
    DateTime _nowDate = DateTime.now();
    String appointmentTime = formatDate(_nowDate, [HH, ':', nn]);
    return appointmentTime;
  }

  String getNowAppointmentDate() {
    DateTime _nowDate = DateTime.now();
    String appointmentDate =
    formatDate(_nowDate, [yyyy, '年', mm, '月', dd, '日']);
    return appointmentDate;
  }

  String dateToString(String timeDate) {
    try {
      int time = int.parse(timeDate) * 1000;
      DateTime _nowDate = DateTime.fromMillisecondsSinceEpoch(time);

      String appointmentDate =
      formatDate(_nowDate, [yyyy, '年', mm, '月', dd, '日', HH, ':', nn]);

      return appointmentDate;
    } catch (e, stack) {
      return '';
    }
  }

  String nowTimeToString() {
    DateTime _nowDate = new DateTime.now();
    var a = _nowDate.millisecondsSinceEpoch; //时间戳
    var dateTime = DateTime.fromMillisecondsSinceEpoch(a);

    return dateTime.toString();
  }

  ///规则展示 月-日 时：分
  String nowTimeMonthToString() {
    DateTime _nowDate = DateTime.now();
    String appointmentDate =
    formatDate(_nowDate, [mm, '.', dd, '  ', HH, ':', nn]);
    return appointmentDate;
  }

  String dateNowTimeToString() {
    DateTime _nowDate = new DateTime.now();
    return (_nowDate.millisecondsSinceEpoch).toString();
  }
}
