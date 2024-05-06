import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_edspert/model/course_model_response.dart';

class CourseListWidget extends StatelessWidget {
  final List<CourseData> courseList;
  const CourseListWidget({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 10,),
                itemBuilder: (context, index){
                  final course = courseList[index];

                  return Container(
                    height: 96,
                    padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
                    decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.network(course.urlCover ?? '',
                            width: 28, height: 28,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 28, width: 28, color: Colors.redAccent,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [             
                              Text(
                                course.majorName ?? '', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                                ),
                              Text('${course.jumlahDone}/${course.jumlahMateri} Paket Latihan Soal', 
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF8E8E8E)),),
                              const SizedBox(height: 6,),
                              const LinearProgressIndicator(value: 0.5),
                            ],
                          ),
                        ),
                      ],
                    ));
                }
                );
  }
}