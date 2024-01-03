import 'package:desktop/models/notification_model.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key, required this.notification,});
  final NotificationModel notification;
  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool reveal =false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          reveal =!reveal;
        });
      },
      child: reveal?Row(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(ProjectColors.whiteColor),
                  border: Border.all(
                    color: const Color(ProjectColors.blackColorText).withOpacity(.4)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:  const Color(ProjectColors.whiteColor).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0,2), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.7,
                        child: Text(
                          widget.notification.title,
                          style: const TextStyle(
                              color: Color(ProjectColors.textColorGreen),
                              fontSize: 20
                          ),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.7,
                        child: Text(
                          widget.notification.content,
                          style: const TextStyle(
                              color: Color(ProjectColors.blackColorText),
                              fontSize: 16
                          ),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            timeago.format(widget.notification.date),
                            style: const TextStyle(
                                color: Color(ProjectColors.textColorGreen),
                                fontSize: 14
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  //on click delete notification
                },
                child: const Icon(Icons.delete, color: Colors.red, size: 24,),
              ),
              const SizedBox(width: 5,),
              InkWell(
                onTap: (){
                  //on click, mark notification as read
                },
                child: const Icon(Icons.close, color: Colors.black, size: 24,),
              )
            ],
          )
        ],
      ):  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(ProjectColors.whiteColor),
          boxShadow: [
            BoxShadow(
              color:  const Color(ProjectColors.whiteColor).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0,2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.notification.title,
                  style: const TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 20
                  ),
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.notification.content,
                  style: const TextStyle(
                      color: Color(ProjectColors.blackColorText),
                      fontSize: 16
                  ),
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    timeago.format(widget.notification.date),
                    style: const TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontSize: 14
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
