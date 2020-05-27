import 'package:flutter/material.dart';

import 'utils/utils.dart';
import 'model/lesson.dart';

class DetailPage extends StatelessWidget {

  final Lesson lesson;

  DetailPage({Key key, this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Top

    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: AppConstant.progressBarColor,
            value: lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)
        ),
      ),
    );

    final coursePrice = Container(
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        "\$" + lesson.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60.0),
        Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 8.0),
        Text(
          lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        ),
        SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      lesson.level,
                      style: TextStyle(color: Colors.white),
                    )
                )
            ),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppConstant.cardBackgroundColor,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  AppConstant.cardBackgroundColor, BlendMode.srcATop),
              image: AssetImage("drive-steering-wheel.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    // Bottom

    final bottomContentText = Text(
      lesson.content,
      style: TextStyle(fontSize: 18.0),
    );

    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: AppConstant.backgroundColor,
          child: Text(
              "TAKE THIS LESSON",
              style: TextStyle(color: Colors.white)
          ),
        )
    );

    final bottomContent = Expanded(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                children: <Widget>[bottomContentText, readButton],
              ),
            ),
          ),
        )
    );

    return Scaffold(
        body: Column(
            children: <Widget>[topContent, bottomContent]
        )
    );
  }
}
