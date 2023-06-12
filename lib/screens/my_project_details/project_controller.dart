import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/my_project_details/project_model.dart';

class ProjectController extends GetxController {
  RxList<Project> projectList = <Project>[
    Project(
      name: "Test Project",
      approvalStatus: false,
      descriptionOne: "description 1",
      price: "200",
      image: "https://wallpaperaccess.com/full/2841748.jpg",
    )
  ].obs;
}

class ProjectService {
  Future fetchProjectList() async {
    try {
      final response = Dio().get("api");
    } catch (e) {
      debugPrint("Err : fetchProjectList $e");
    }
  }
}
