import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/base/widgets/custom_app_bar.dart';
import 'package:untitled6/data/datamodel/coutnries/countries.dart';
import 'package:untitled6/data/rest/rest_client.dart';

class NobelPrizePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NobelPrizePage();
  }
}

class _NobelPrizePage extends State<NobelPrizePage> {
  Future<Countries> getData() async {
    return await RestClient.getAPI().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Countries"),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: getData(),
                builder: (BuildContext ctx, AsyncSnapshot<Countries> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Has error");
                  } else {
                    return Container(
                      height: double.maxFinite,
                      child: ListView.builder(
                          primary: false,
                          itemCount: snapshot.data!.countries!.length,
                          itemBuilder: (context, index) {
                            String name = "";
                            String code = "";
                            try {
                              name = snapshot.data!.countries![index]!.name!.toString();
                              code = snapshot.data!.countries![index]!.code!.toString();
                            } catch (e) {
                              name = "Error";
                            }
                            return Material(
                                child: Card(
                                  child: ListTile(
                                    title: Text(name),
                                    subtitle: Text(code),
                                  ),
                                )
                            );
                          }
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}