import 'package:islami_c13/style/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/SuraModel.dart';

class PrefHelper{
  static late SharedPreferences prefs ;
  static  init()async{
    prefs = await SharedPreferences.getInstance();
  }
  static addRecentList(List<SuraModel> mostRecentList){
    List<String> mostRecentStringList = mostRecentList.map((sura) => sura.suraNameEn).toList();
    prefs.setStringList("mostRecent", mostRecentStringList);
  }
  static List<SuraModel> getRecentList(){
    List<String> mostStringList = prefs.getStringList("mostRecent")??[];
    List<SuraModel> mostRecent = [];
    for(String suraName in mostStringList){
     SuraModel suraFound =  suraList.firstWhere((sura) => sura.suraNameEn==suraName);
     mostRecent.add(suraFound);
    }
    return mostRecent;
  }
}

class Person{
  static Person _instance = Person._init();
  static Person getInstance()=>_instance;
  Person._init();
}