import 'package:flutter/material.dart';

class Congratulate extends StatelessWidget {
  const Congratulate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('查看申请信息'),
      ),
      body: StackModal(),
    );
  }
}

class StackModal extends StatelessWidget {
  const StackModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        // color: Color.fromARGB(142, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                // offset: Offset(3, 5),
                blurRadius: 30,
                // spreadRadius: 11,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      'assets/bg.jpeg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: () {},
                      child: Ink(
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Hi 罗翔，恭喜你！',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromRGBO(238, 73, 89, 1),
                    letterSpacing: 2,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '获得',
                      style: TextStyle(
                        color: Color.fromRGBO(95, 95, 95, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '[三好学生]',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 168, 0, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '荣誉称号',
                      style: TextStyle(
                        color: Color.fromRGBO(95, 95, 95, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '你在班级综合排名第 ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  Text(
                    '3 ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '，超过全系80%的人',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
