import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/view_model.dart';

// ignore: must_be_immutable
class SchoolInfo extends StatelessWidget {
  SchoolInfo({Key? key}) : super(key: key);

  String schoolName = "School Name";
  String schoolAddress = "School Address";
  String studentsNo = "Number of Students";
  String teachersNo = "Number of Teachers";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SchoolViewModel(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color(0xff477B71),
          leading: const Icon(
            Icons.menu,
            size: 30,
          ),
          title: const Text(
            'School Info',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            ),
          ),
        ),
        body: Consumer<SchoolViewModel>(
          builder: (context, viewModel, child) => SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/school.png',
                  width: 250,
                ),
              ),
              const SizedBox(height: 15),
              reusableTextField(
                viewModel.schoolData?.schoolName ?? 'School Name',
                Icons.school,
              ),
              const SizedBox(height: 15),
              reusableTextField(
                viewModel.schoolData?.schoolAddress ?? 'School Address',
                Icons.location_on_rounded,
              ),
              const SizedBox(height: 15),
              reusableTextField(
                viewModel.schoolData?.numOfStudents ?? 'Number of Students',
                Icons.person,
              ),
              const SizedBox(height: 15),
              reusableTextField(
                viewModel.schoolData?.numOfTeachers ?? 'Number of Teachers',
                Icons.person,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Container(
                    width: 300,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0, 1),
                            blurRadius: 12.0)
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                      color: const Color(0xffe9b637),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ButtonTheme(
                        minWidth: 300,
                        child: Consumer<SchoolViewModel>(
                          builder: (context, viewModel, _) => TextButton(
                            onPressed: () async {
                              await viewModel.fetchSchoolData();
                            },
                            child: const Text(
                              'Show Data',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget reusableTextField(String text, IconData iconShape) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffd3d3d3),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              iconShape,
              color: Colors.white,
              size: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
