import 'package:flutter/material.dart';
import 'package:water_tracer_app/water_consume.dart';

class WaterTrace extends StatefulWidget {
  const WaterTrace({Key? key}) : super(key: key);

  @override
  State<WaterTrace> createState() => _WaterTraceState();
}

class _WaterTraceState extends State<WaterTrace> {
  List<WaterConsume> waterConsumeList = [];
  int value = 0;
  final TextEditingController _noOfGlassTEController =
      TextEditingController(text: "1");
  final TextEditingController _noteController=TextEditingController(text: "Morning");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          centerTitle: true,
          title: const Text(
            "Water App",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          if (_noOfGlassTEController.text.trim().isEmpty) {
                            _noOfGlassTEController.text = "1";
                          }
                          final noOfglass = _noOfGlassTEController.text.trim();
                          int value = int.tryParse(noOfglass) ?? 1;
                          waterConsumeList.insert(0,
                          WaterConsume(value, DateTime.now(),_noteController.text));
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              border:
                                  Border.all(color: Colors.yellow, width: 4),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Text(
                            "Tap to Add",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          child: TextFormField(
                            controller: _noOfGlassTEController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 16,),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            controller: _noteController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: waterConsumeList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(waterConsumeList[index].toString()),
                          ),

                          title: Text("Glass of water ${waterConsumeList[index].toString()}"),
                          subtitle: Text(
                              "Time of drink ${waterConsumeList[index].time}"),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
