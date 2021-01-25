import 'package:billionaireapi/JsonData.dart';
import 'package:billionaireapi/Services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading;
  List<Billionaire> _finallist;

  @override
  void initState() {
    super.initState();

    loading = true;
    ServiceJson.getBillionaire().then((finallist) {
      setState(() {
        _finallist = finallist;
        loading = false;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        title: Text(
          loading ? "Loading.." : "Billionaire List",
        ),
      ),
      body:
      Container(
        child: ListView.builder(
          itemCount: null== _finallist ? 0 : _finallist.length,
          itemBuilder: (context,index){
            Billionaire parser=_finallist[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(parser.personName[0]),
              ),
              title: Text(parser.personName),
              subtitle: Text(parser.source),
              trailing: Text(parser.rank.toString()),
            );
          },
        ),
      ),
    );
  }
}
