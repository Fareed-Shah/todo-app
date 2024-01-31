import 'package:flutter/material.dart';
import 'package:job_post_app/classes/job_post.dart';
import 'package:job_post_app/screens/form_view.dart';
import 'package:job_post_app/screens/sign_in_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<JobPost> items = [];
  String userName = "";

  @override
  void initState() {
    super.initState();
    userInfo();
  }

  userInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userName = sp.getString('name') ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          userName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) => AlertDialog(
                          backgroundColor: Colors.blue,
                          title: const Text(
                            'Sign Out?',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                            TextButton(
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const SignIn())));
                                  SharedPreferences sp =
                                      await SharedPreferences.getInstance();
                                  sp.clear();
                                },
                                child: const Text('Yes',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                          ],
                          // elevation: 24.0,
                        ));
              },
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),

      body: ListView.builder(
        itemCount: items.length, itemBuilder: appCard,
        // children: items.map((e) => appCard(e)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<JobPost>(
                  context, MaterialPageRoute(builder: (_) => const FormView()))
              .then((value) => setState(() {
                    items.add(value!);
                  }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget appCard(BuildContext context, int index) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(
                    items[index].description,
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                JobPost? data = await Navigator.push<JobPost>(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FormView(
                              title: items[index].title,
                              descrip: items[index].description,
                              isEdit: true,
                            )));
                if (data != null) {
                  setState(() {
                    items[index].title = data.title;
                    items[index].description = data.description;
                  });
                }
              },
              child: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  items.removeAt(index);
                });
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
