import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText(this.text, {super.key});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: isExpanded
              ? Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50.sp,
                  ),
                )
              : RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.text.length > 100
                            ? widget.text.substring(0, 100)
                            : widget.text,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50.sp,
                        ),
                      ),
                      if (widget.text.length > 100)
                        TextSpan(
                          text: "...xem thêm",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 50.sp,
                          ),
                        ),
                    ],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
        );
      },
    );
  }
}
