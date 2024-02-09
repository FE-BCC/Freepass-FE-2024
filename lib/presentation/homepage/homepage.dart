import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// import 'package:urdentist/data/model/response/profile/profile_response.dart';
import 'package:urdentist/data/repository/daily_task.dart';
import 'package:urdentist/presentation/chooseProfile/profile_controller.dart';
import 'package:urdentist/presentation/homepage/task_controller.dart';
// import 'package:urdentist/route/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  var profileController = Get.find<ProfileController>();
  var taskController = Get.find<TaskController>();
  var date = DateTime.now();
  String tahun = "";
  String bulan = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Dependencies changed');
    fetchData();
  }

  Future<void> fetchData() async {
    DateTime tanggalLahir = profileController.profile.value.tanggalLahir;
    int umurTahun = date.year - tanggalLahir.year;
    int umurBulan = date.month - tanggalLahir.month;

    if (date.day < tanggalLahir.day) {
      umurBulan -= 1;
    }

    if (umurBulan < 0) {
      umurTahun -= 1;
      umurBulan += 12;
    }

    tahun = '$umurTahun years';
    if (umurBulan > 0) {
      bulan = ' $umurBulan month';
    }

    var year = date.year.toString();
    var month = date.month.toString().padLeft(2, '0');
    var day = date.day.toString().padLeft(2, '0');

    taskController.profileId = profileController.profile.value.id;
    taskController.date = "$year-$month-$day";

    try {
      await taskController.getTasks(onSuccess: (tasks) {
        taskController.tasks.value = tasks;
        List<int> taskIds =
            taskController.tasks.map((task) => task.taskId).toList();

        taskController.dailyTasks.value = globalDailyTasks.where((globalTask) {
          return !taskIds.any((taskId) => taskId == globalTask.id);
        }).toList();
      }, onFailed: (error) {
        print('$error ');
      });
    } catch (error) {
      print('$error');
      // Handle the error appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // String fullName = UserManager.instance.getFullName();
    // String email = UserManager.instance.getEmail();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: height * 0.28,
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, top: 20),
                          height: height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(width * 0.08),
                              bottomRight: Radius.circular(width * 0.08),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/icon_avatar.png',
                              ),
                              Container(
                                margin: EdgeInsets.only(left: width * 0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          profileController
                                              .profile.value.namaLengkap,
                                          style: TextStyle(
                                            fontSize: width * 0.05,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      padding: EdgeInsets.symmetric(
                                        vertical: height * 0.004,
                                        horizontal: width * 0.02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Text(
                                        '$tahun and $bulan',
                                        style: TextStyle(
                                          fontSize: width * 0.03,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: height * 0.06,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Positioned(
                  top: height * 0.11,
                  left: width * 0.075,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1.2,
                            offset: Offset(0, 0.2),
                          ),
                        ],
                        color: Colors.yellow.shade50,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: width * 0.85,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/icon_trophy.png',
                              width: width * 0.18,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '11 Exp Points',
                                  style: TextStyle(
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04),
                                ),
                                SizedBox(
                                  height: height * 0.008,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Sesuaikan dengan radius yang diinginkan
                                  child: const LinearProgressIndicator(
                                    value: 11 / 100,
                                    backgroundColor: Colors.grey,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue),
                                    minHeight: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.008,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Novice',
                                      style: TextStyle(
                                          color: Colors.blue.shade800,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04),
                                    ),
                                    Text(
                                      'Master',
                                      style: TextStyle(
                                          color: Colors.blue.shade800,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04),
                                    ),
                                  ],
                                )
                              ],
                            ))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),
                        Container(
                          height: 2,
                          color: Colors.yellow.shade600,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Wow, your points are still low this period, let's complete the daily tasks to increase your points!",
                          style: TextStyle(
                              fontSize: width * 0.032,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Our Service',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: width * 0.055),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: height * 0.01, bottom: height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon_health_tracker.png',
                        width: width * 0.25,
                        height: height * 0.08,
                      ),
                      Text(
                        'Health Tracker',
                        style: TextStyle(
                          fontSize: width * 0.036,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon_caries_detector.png',
                        width: width * 0.25,
                        height: height * 0.08,
                      ),
                      Text(
                        'Caries Detector',
                        style: TextStyle(
                          fontSize: width * 0.036,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon_dentist.png',
                        width: width * 0.25,
                        height: height * 0.08,
                      ),
                      Text(
                        'Find Dentist',
                        style: TextStyle(
                          fontSize: width * 0.036,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(bottom: height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Task',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.055),
                  ),
                  Text('View More',
                      style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // Widget yang akan ditampilkan setelah fetchData selesai
                      return Column(
                        children: taskController.dailyTasks.map((task) {
                          task.updateStatus();
                          return DailyTaskWidget(task, 'home');
                        }).toList(),
                      );
                    } else {
                      // Widget atau indikator loading sementara fetchData berjalan
                      return CircularProgressIndicator();
                    }
                  },
                )),
            Container(
              margin:
                  EdgeInsets.only(top: height * 0.015, bottom: height * 0.01),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Article',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.055),
                  ),
                  Text('View More',
                      style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 20, right: 20, bottom: height * 0.01),
              padding: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1.2,
                    offset: Offset(0, 0.2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/article1.jpg',
                      width: width * 0.25,
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oral Health',
                          style: TextStyle(
                            fontSize: width * 0.03,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          'Healthy teeth, healthy smile.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '6 January 2024',
                              style: TextStyle(
                                fontSize: width * 0.027,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              'Read More',
                              style: TextStyle(
                                fontSize: width * 0.027,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 20, right: 20, bottom: height * 0.01),
              padding: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1.2,
                    offset: Offset(0, 0.2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/article1.jpg',
                      width: width * 0.25,
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oral Health',
                          style: TextStyle(
                            fontSize: width * 0.03,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          'Healthy teeth, healthy smile.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '6 January 2024',
                              style: TextStyle(
                                fontSize: width * 0.027,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              'Read More',
                              style: TextStyle(
                                fontSize: width * 0.027,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DailyTaskWidget extends StatefulWidget {
  var task;
  String page;

  DailyTaskWidget(this.task, this.page);

  @override
  _DailyTaskWidgetState createState() => _DailyTaskWidgetState();
}

class _DailyTaskWidgetState extends State<DailyTaskWidget> {
  var taskController = Get.put(TaskController());
  _HomePageState home = _HomePageState();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return widget.task.profileId == 0
        ? widget.task.id == 2 || widget.task.id == 5
            ? Container()
            : widget.task.status && widget.page == "home"
                ? Container()
                : Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    margin: EdgeInsets.only(
                      bottom: height * 0.015,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1.2,
                          offset: Offset(0, 0.2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              widget.task.image,
                              width: width * 0.11,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: width * 0.4,
                              child: Text(
                                widget.task.description,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            !widget.task.status
                                ? setState(() {
                                    widget.task.status = true;
                                  })
                                : '';
                            taskController.completeTask(
                                taskId: widget.task.id,
                                onSuccess: (msg) {
                                  print(msg);
                                  home.fetchData();
                                },
                                onFailed: (msg) {
                                  print(msg);
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: !widget.task.status
                                  ? Colors.blue.shade700
                                  : Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  color: !widget.task.status
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
        : widget.task.taskId == 2 || widget.task.taskId == 5
            ? Container()
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                margin: EdgeInsets.only(
                  bottom: height * 0.015,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1.2,
                      offset: Offset(0, 0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.task.taskId == 1
                              ? 'assets/images/task1.png'
                              : widget.task.taskId == 3
                                  ? 'assets/images/task3.png'
                                  : widget.task.taskId == 4
                                      ? 'assets/images/task4.png'
                                      : '',
                          width: width * 0.11,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: width * 0.4,
                          child: Text(
                            widget.task.nama,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade200,
                      ),
                      child: Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
  }
}
