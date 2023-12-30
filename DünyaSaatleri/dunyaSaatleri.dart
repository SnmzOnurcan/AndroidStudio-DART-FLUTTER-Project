import "package:http/http.dart";
import "dart:convert";
import "package:intl/intl.dart";
class DunyaSaatleri{
  String lokasyon="";
  String zaman="";
  String bayrak="";
  String arkPlan="";
  String urlLokasyon="";
  bool? gunduzMu=false;

  DunyaSaatleri({required this.lokasyon, required this.bayrak,
    required this.arkPlan,required this.urlLokasyon});

  Future<void> getData() async

  {//hata yakalama-> yönetme //exception handling.
    try {
      Response r = await get(Uri.parse("http://worldtimeapi.org/api/"
          "timezone/$urlLokasyon"));
      Map veri = jsonDecode(r.body);
      String dateTime = veri["datetime"];
      String offset = veri["utc_offset"].substring(1, 3);

      DateTime simdi = DateTime.parse(dateTime);
      simdi = simdi.add(Duration(hours: int.parse(offset)));
      var saat=simdi.hour;
      gunduzMu=(saat>6 && saat<12? true:false);
      String durum=(saat<12)?"ÖÖ":"ÖS";
      var formatVeri=DateFormat("hh:mm ");
      zaman=formatVeri.format(simdi)+durum;

    }
    catch (e)
    {
      zaman="Saat bir şekilde alınamadı!";
    }
  }
}