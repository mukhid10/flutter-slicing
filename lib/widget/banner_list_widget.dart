import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_edspert/model/banner_model_response.dart';

class BannerListWidget extends StatelessWidget {
  final List<BannerData> bannerList;
  const BannerListWidget({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 146,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: bannerList.length,
          separatorBuilder: (context, index) => const SizedBox(width: 29,),
          itemBuilder: (context, index){
            final banner = bannerList[index];
    
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 146, width: 284,
                child: Image.network(banner.eventImage ?? '', fit: BoxFit.cover,),
                ),
            );
          }
          ),
    );
  }
}