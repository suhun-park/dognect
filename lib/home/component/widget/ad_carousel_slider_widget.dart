import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dognect/home/provider/ad_carousel_slider_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AdCarouselSliderWidget extends StatefulWidget {
   const AdCarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<AdCarouselSliderWidget> createState() => _AdCarouselSliderWidgetState();
}

class _AdCarouselSliderWidgetState extends State<AdCarouselSliderWidget> {

  @override
  Widget build(BuildContext context) {
    final carouselSliderProvider = Provider.of<AdCarouselSliderProvider>(context);
    return FutureBuilder<List>(
        future: carouselSliderProvider.getAdvertisement(),
        builder: (BuildContext context, AsyncSnapshot<List>snapshot){
      if(snapshot.hasError){
        return Text('에러');
      }else if(snapshot.hasData){
        return  Column(children:[CarouselSlider(
          carouselController: carouselSliderProvider.controller,
          items: snapshot.data!.map((e) => Container(
            width: double.infinity,
            height: 100.h,
            child:InkWell(
              onTap: (){},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(e,fit: BoxFit.fill,),),
            ))).toList(),
          options: CarouselOptions(
            initialPage: 0,
              autoPlay: true,
              aspectRatio: 2.5,
              enlargeCenterPage: true,
            onPageChanged: (index,reason)  => carouselSliderProvider.pageController(index),
            enableInfiniteScroll: true,
          ),),
          SizedBox(
            height: 10.h,
          ),
          CarouselIndicator(
            activeColor: Colors.black,
            color: Colors.white,
            count: carouselSliderProvider.dataLength,
            index: carouselSliderProvider.currentPage,
          )

        ]);

      }
      return const CircularProgressIndicator();
    }
    );
  }
}
