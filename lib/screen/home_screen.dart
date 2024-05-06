import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_edspert/datasource/banner_remote_datasource.dart';
import 'package:flutter_edspert/datasource/learning_remote_datasource.dart';
import 'package:flutter_edspert/model/banner_model_response.dart';
import 'package:flutter_edspert/model/course_model_response.dart';
import 'package:flutter_edspert/widget/banner_list_widget.dart';
import 'package:flutter_edspert/widget/course_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bannerRemoteDataSource = BannerRemoteDataSource();
  final courseRemoteDataSource = CourseRemoteDataSource();

  BannerResponse? _bannerResponse;
  CourseResponse? _courseResponse;

  @override
  void initState() {
    getBanner();
    getCourse();
    super.initState();
  }

  void getBanner()async{
      _bannerResponse = await bannerRemoteDataSource.getBanners();

      setState(() {
        
      });
  }

    void getCourse()async{
      _courseResponse = await courseRemoteDataSource.getCourses();

      setState(() {
        
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Hi, Altop', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                        Text('Selamat Datang', style: TextStyle(fontSize: 12),)
                      ],
                    ),
                    const CircleAvatar(
                      radius: 17.5,
                      backgroundImage: NetworkImage('https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg'),
                    )
                  ],
                ),
                const SizedBox(height: 12,),
                Container(
                  height: 147,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF3A7FD5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 26),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Mau kerjain\nlatihan soal\napa hari ini?',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset('assets/images/welcoming.png', width: 187, height: 97,))
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Pilih Pelajaran', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),),
                    TextButton(onPressed: () {}, child: 
                      const Text('Lihat Semua', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF3A7FD5)),),
                    )
                  ],
                ),
                // const SizedBox(height: 5,),
                CourseListWidget(courseList: _courseResponse?.data ?? []),
                const SizedBox(height: 20,),
                const Text('Terbaru', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),),
                const SizedBox(height: 12,),
                BannerListWidget(bannerList: _bannerResponse?.data ?? []),
              ],
            ),
          ),
        ),
      ) 
    );
  }
}