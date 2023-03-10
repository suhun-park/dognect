import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'package:provider/provider.dart';

import '../../provider/kpostal_provider.dart';


class KpostalWidget extends StatelessWidget {
  const KpostalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<KpostalProvider>(context);
    return Column(children:[
          TextButton(
          onPressed: () async{
            Navigator.of(context).push<Kpostal>(
                MaterialPageRoute(
                builder: (_) =>(
              KpostalView(
                useLocalServer: false,
                kakaoKey: '5c27f040a4944296c9d6b5586c9360b2',
                callback: (Kpostal result) => getData.kpostalCallBack(result),
              )
                ),
                ),
            );
          },
          child: Icon(Icons.search,size: 14,),
        ),
    ]);

  }
}
