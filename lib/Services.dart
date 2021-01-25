import 'package:http/http.dart' as http;

import 'JsonData.dart';

class ServiceJson{
  static const String url = "https://forbes400.herokuapp.com/api/forbes400?limit=10";

static Future<List<Billionaire>> getBillionaire() async{
  try{
    final response =await http.get(url);
    if(200==response.statusCode){
      final List<Billionaire> billionairelist=billionaireFromJson(response.body);
      return billionairelist;
    }
    else{
      getBillionaire();
    }
  }
  catch(e){
return null;
  }
}
}