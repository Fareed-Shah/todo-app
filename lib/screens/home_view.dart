import 'package:flutter/material.dart';
import 'package:job_post_app/classes/job_post.dart';
import 'package:job_post_app/screens/form_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<JobPost> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
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
