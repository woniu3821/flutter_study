import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Container(
      //   child: Image.network(
      //     'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F092919113248%2F1Z929113248-8-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1650788797&t=3481267fdd24206cc8fe438de7fb2292',
      //     // color: Colors.blue,
      //     // colorBlendMode: BlendMode.softLight,
      //     // width: 100,
      //     // height: 100,
      //     // fit: BoxFit.fitWidth,
      //     // alignment: Alignment.center,
      //     repeat: ImageRepeat.repeat, //使用fit时候不生效
      //   ),
      //   width: 300,
      //   height: 300,
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.blue,
      //     ),
      //   ),
      // ),

//圆角图片

      // child: Container(
      //   // child: Image.network(
      //   //   'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F092919113248%2F1Z929113248-8-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1650788797&t=3481267fdd24206cc8fe438de7fb2292',
      //   //   // fit: BoxFit.cover,
      //   // ),
      //   height: 300,
      //   width: 300,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(150),
      //     color: Colors.yellow,
      //     image: DecorationImage(
      //       image: NetworkImage(
      //           "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F092919113248%2F1Z929113248-8-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1650788797&t=3481267fdd24206cc8fe438de7fb2292"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   clipBehavior: Clip.antiAlias,
      // ),

      child: ClipOval(
        child: Image.network(
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F092919113248%2F1Z929113248-8-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1650788797&t=3481267fdd24206cc8fe438de7fb2292',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
      //   //   // fit: BoxFit.cover,)),
    );
  }
}
