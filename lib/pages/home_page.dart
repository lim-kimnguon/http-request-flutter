import 'package:flutter/material.dart';
import 'package:http_request/services/api_service.dart';
import 'package:intl/intl.dart';

import '../models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User>? users;
  var isLoaded = false;

  // check whether the app is reload
  @override
  void initState() {
    super.initState();

    // fetch data from API
    getData();
  }

  getData() async {
    // call service to get data from api
    users = await ApiService().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http request'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: users?.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Column(
                children: [
                  Text(users![index].username),
                  Text(users![index].email),
                  Text(users![index].createdAt.toString())
                ],
              ),
            );
          },
        ),
      ),
      
    );
  }
}