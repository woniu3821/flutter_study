import 'package:flutter/material.dart';

class DialogTestRoute extends StatefulWidget {
  DialogTestRoute({Key? key}) : super(key: key);

  static String routeName = '/dialog_route';

  @override
  State<DialogTestRoute> createState() => _DialogTestRouteState();
}

class _DialogTestRouteState extends State<DialogTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dialog对话框'),
      ),
      body: Center(
        child: Column(
          children: [
            //点击该按钮后弹出对话框
            ElevatedButton(
              child: Text("对话框1"),
              onPressed: () async {
                //弹出对话框并等待其关闭
                bool? delete = await showDeleteConfirmDialog1();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                  //... 删除文件
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                changeLanguage();
              },
              child: Text("对话框2"),
            ),
            ElevatedButton(
              onPressed: () {
                showListDialog();
              },
              child: Text("使用列表的对话框"),
            ),
            ElevatedButton(
              onPressed: () {
                showCustomDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("您确定要删除当前文件吗?"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("取消"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: Text("删除"),
                          onPressed: () {
                            // 执行删除操作
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("自定义对话框"),
            ),
            ElevatedButton(
              child: Text("话框3（复选框可点击）"),
              onPressed: () async {
                //弹出删除确认对话框，等待用户确认
                bool? deleteTree = await showDeleteConfirmDialog3();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                _showModalBottomSheet();
              },
              child: Text('底部对话框'),
            ),
            ElevatedButton(
                onPressed: showLoadingDialog, child: Text('Loading 可设置宽度'))
          ],
        ),
      ),
    );
  }

// 弹出对话框
  Future<bool?> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage() async {
    int? i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog() async {
    int? index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  Future<T?> showCustomDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required WidgetBuilder builder,
    ThemeData? theme,
  }) {
    final ThemeData theme = Theme.of(context).copyWith(shadowColor: Colors.red);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);

        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87, // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

// 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  Future<bool?> showDeleteConfirmDialog3() {
    bool _withTree = false; //记录复选框是否选中

    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("您确定要删除当前文件吗?"),
                Row(
                  children: [
                    Text("同时删除子目录？"),
                    // DialogCheckbox(
                    //   value: _withTree,
                    //   onChanged: (bool? value) {
                    //     //更新选中状态
                    //     _withTree = !_withTree;
                    //   },
                    // ),

                    // StatefulBuilder(
                    //   builder: (context, _setState) {
                    //     return Checkbox(
                    //         value: _withTree,
                    //         onChanged: (val) {
                    //           _setState(() {
                    //             //更新选中状态
                    //             _withTree = !_withTree;
                    //           });
                    //         });
                    //   },
                    // ),

                    // 通过Builder来获得构建Checkbox的`context`，
                    // 这是一种常用的缩小`context`范围的方式
                    Builder(
                      builder: (BuildContext context) {
                        return Checkbox(
                          value: _withTree,
                          onChanged: (value) {
                            // 标记为“dirty”Element对象
                            (context as Element).markNeedsBuild();
                            _withTree = !_withTree;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text("删除"),
                onPressed: () {
                  //执行删除操作
                  Navigator.of(context).pop(_withTree);
                },
              ),
            ],
          );
        });
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class StatefulBuilder extends StatefulWidget {
//   StatefulBuilder({Key? key, required this.builder})
//       : assert(builder != null),
//         super(key: key);
//   final StatefulWidgetBuilder builder;
//   @override
//   State<StatefulBuilder> createState() => _StatefulBuilderState();
// }

// class _StatefulBuilderState extends State<StatefulBuilder> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.builder(context, setState);
//   }
// }

// class DialogCheckbox extends StatefulWidget {
//   DialogCheckbox({Key? key, this.value, required this.onChanged})
//       : super(key: key);

//   final ValueChanged<bool?> onChanged;
//   final bool? value;

//   @override
//   State<DialogCheckbox> createState() => _DialogCheckboxState();
// }

// class _DialogCheckboxState extends State<DialogCheckbox> {
//   bool? value;

//   @override
//   void initState() {
//     value = widget.value;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//         value: value,
//         onChanged: (val) {
//           widget.onChanged(val);
//           setState(() {
//             value = val;
//           });
//         });
//   }
// }
