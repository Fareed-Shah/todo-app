import 'package:flutter/material.dart';
import 'package:job_post_app/classes/job_post.dart';

class FormView extends StatefulWidget {
  final String? title;
  final String? descrip;

  const FormView({super.key, this.title, this.descrip});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.title != null && widget.descrip != null) {
      titleEditingController.text = widget.title!;
      descriptionEditingController.text = widget.descrip!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Job Posting Screen',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey),
              child: TextFormField(
                controller: titleEditingController,
                style: const TextStyle(color: Colors.black, fontSize: 15.0),
                decoration: const InputDecoration(
                    hintText: "Enter Job Title",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.all(5),
              height: 150.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey),
              child: TextFormField(
                controller: descriptionEditingController,
                style: const TextStyle(color: Colors.black, fontSize: 15.0),
                decoration: const InputDecoration(
                    hintText: "Enter Job Description",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            GestureDetector(
              onTap: () {
                onSave(context, titleEditingController.text,
                    descriptionEditingController.text);
              },
              child: Container(
                width: 200.0,
                margin: const EdgeInsets.only(top: 15.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey),
                child: const Center(
                  child: Text("Submit",
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onSave(BuildContext context, String title, String descrip) {
    Navigator.pop(context, JobPost(title: title, description: descrip));
    print(title);
  }
}
