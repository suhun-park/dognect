import 'package:dognect/notice/page/provider/album_detail_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AlbumDetailScreen extends StatefulWidget {
  const AlbumDetailScreen({Key? key}) : super(key: key);

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final albumDetailProvider = Provider.of<AlbumDetailProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: albumDetailProvider.albumDataGet(),
              builder: (context,snapshot){
            if(snapshot.hasError){
              print(snapshot.error);
            }else if(snapshot.hasData){
              final snapshotData = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                  return Container(

                    margin: EdgeInsets.all(10.w),
                    width: double.infinity,height: 130.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10.w),
                      alignment: Alignment.topLeft,

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshotData![index].title.toString()),
                              Text(snapshotData![index].date.toString()),
                            ],
                          ),
                          FutureBuilder(
                              future: albumDetailProvider.getAlbumImageGet(context),
                              builder: (context,snapshot){
                                final snapshotImageData = snapshot.data;
                            if(snapshot.hasError){
                              return Container();
                            }else if(snapshot.hasData){
                              return Container(
                                margin: EdgeInsets.all(10.h),
                                width: double.infinity.w,height: 65.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data?.length,
                                 itemBuilder: (BuildContext context, int index) {
                                   return  Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Image.network(snapshotImageData?[index],)
                                     ],
                                   );
                                 },
                                ),
                              );
                            }return CircularProgressIndicator();
                          })
                        ]
                      ),
                    ),
                  );
                });
            }
            return CircularProgressIndicator();
          })

        ],
      ),
    );
  }
}
