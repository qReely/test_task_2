import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_task_2/profile_page.dart';
import 'package:http/http.dart' as http;
import 'package:test_task_2/university_model.dart';
import 'package:test_task_2/university_webview.dart';

class UniversityPage extends StatefulWidget {
  const UniversityPage({Key? key}) : super(key: key);

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  final url =
      Uri.parse("http://universities.hipolabs.com/search?country=Kazakhstan");
  bool _isLoading = true;
  List<University> unies = [];

  @override
  void initState() {
    super.initState();
    getUniversities();
  }

  Future getUniversities() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // successfully loaded
      var list = jsonDecode(response.body) as List;

      var toRemove = {};
      list.forEach((e) {
        toRemove.putIfAbsent("$e", () => e);
      });
      list = toRemove.values.toList();

      unies = list.map((uni) => University.fromJson(uni)).toList();

    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()));
                },
                icon: Image.asset("assets/user.png")),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${unies.length} Университета",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 465,
                  child: ListView.builder(
                    itemCount: unies.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: Colors.grey.shade400,
                              )),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        height: 52,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          title: Text(unies[index].name),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            String url = unies[index].web_pages[0];
                            url = url.replaceAll("http", "https");
                            print(url);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UniversityWebView(url: url, name: unies[index].name)));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
