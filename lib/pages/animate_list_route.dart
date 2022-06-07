import 'package:flutter/material.dart';

class AnimatedListRoute extends StatefulWidget {
  AnimatedListRoute({Key? key}) : super(key: key);

  static String routeName = '/animate_list';

  @override
  State<AnimatedListRoute> createState() => _AnimatedListRouteState();
}

class _AnimatedListRouteState extends State<AnimatedListRoute> {
  var data = <String>[];
  int counter = 5;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < counter; i++) {
      data.add('${i + 1}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表增减动画'),
      ),
      body: Stack(
        children: [
          AnimatedList(
            key: globalKey,
            initialItemCount: data.length,
            itemBuilder: (context, index, animation) {
              return FadeTransition(
                opacity: animation,
                child: buildItem(context, index),
              );
            },
          ),
          buildAddBtn(),
        ],
      ),
    );
  }

// 创建一个 “+” 按钮，点击后会向列表中插入一项

  Widget buildAddBtn() {
    return Positioned(
      child: FloatingActionButton(
        onPressed: () {
          // 添加一个列表项
          data.add('${++counter}');
          // 告诉列表项有新添加的列表项
          globalKey.currentState!.insertItem(data.length - 1);
          print('添加 $counter');
        },
        child: Icon(Icons.add),
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }

//构建列表
  Widget buildItem(context, index) {
    String char = data[index];

    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
          onPressed: () => onDelete(context, index), icon: Icon(Icons.delete)),
    );
  }

  void onDelete(context, index) {
    setState(() {
      globalKey.currentState!.removeItem(
        index,
        (context, animation) {
          // 删除过程执行的是反向动画，animation.value 会从1变为0
          var item = buildItem(context, index);
          print('删除 ${data[index]}');
          data.removeAt(index);
          // 删除动画是一个合成动画：渐隐 + 缩小列表项高度
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              //让透明度变化的更快一些
              curve: Interval(0.5, 1.0), //延迟0.5秒
            ),
            // 不断缩小列表项的高度
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0.0,
              child: item,
            ),
          );
        },
        duration: Duration(microseconds: 200), // 动画时间为 200 ms
      );
    });
  }
}
