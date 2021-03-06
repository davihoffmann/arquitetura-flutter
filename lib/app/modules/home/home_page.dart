import 'package:arquitetura_flutter/app/modules/home/components/custom_switch_widget.dart';
import 'package:arquitetura_flutter/app/modules/home/home_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/models/apiadvisor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String idPessoa;

  HomePage(this.idPessoa) {
    print(idPessoa);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            controller.getTime();
          }),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomSwitchWidget(),
            ValueListenableBuilder<ApiadvisorModel>(
              valueListenable: controller.time,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Text(model.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
