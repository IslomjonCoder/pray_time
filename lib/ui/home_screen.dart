import 'package:flutter/material.dart';
import 'package:pray_time/models/pray_time_model.dart';
import 'package:pray_time/repository/api_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiProvider provider = ApiProvider();
  late final PrayTimeModel data;
  bool isLoading = true;

  @override
  void initState() {
    loadData();

    super.initState();
  }

  loadData() async {
    data = await provider.getTimes();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.region),
                  Text(data.weekday),
                  Text(data.date.toString()),
                  Text(data.times.tongSaharlik),
                  Text(data.times.quyosh),
                  Text(data.times.peshin),
                  Text(data.times.asr),
                  Text(data.times.shomIftor),
                  Text(data.times.hufton),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.get_app),
      ),
    );
  }
}
