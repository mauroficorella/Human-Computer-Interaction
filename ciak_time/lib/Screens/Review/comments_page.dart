import 'package:ciak_time/constants.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key key, @required this.reviewIndex}) : super(key: key);
  
  final int reviewIndex;

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  
  Widget commentChild(data, size) {
    if (reviewsData[widget.reviewIndex]['comments'] == 0) {
      return Column(
        children: [
          SizedBox(height: size.height * 0.05,),
          Text('No comments available', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.02,
                        fontFamily: 'Quicksand',
                        color: Colors.grey,
                      ),),
        ],
      );
    } else {
      return ListView(
        children: [
          for (var i = 0; i < reviewsData[widget.reviewIndex]['comments']; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
              child: ListTile(
                leading: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      
                      borderRadius:
                          new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'])),
                ),
                title: Text(
                  data[i]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(data[i]['message']),
              ),
            )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "Reviews",
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.26,
        title: Text("Comments"),
        centerTitle: true,
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://shop.krystmedia.at/wp-content/uploads/2020/04/avatar-1.jpg",
          child: commentChild(filedata, size),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: "Comment cannot be empty",
          sendButtonMethod: () async {
            await commentConfirmed(size).then((_) {
              if (formKey.currentState.validate() && isCommentConfirmed) {
                
                setState(() {
                  var value = {
                    'name': 'Vittoria',
                    'pic':
                        'https://shop.krystmedia.at/wp-content/uploads/2020/04/avatar-1.jpg',
                    'message': commentController.text
                  };
                  filedata.insert(0, value);
                });
                reviewsData[widget.reviewIndex]['comments'] =
                    reviewsData[widget.reviewIndex]['comments'] + 1;
                commentController.clear();
                FocusScope.of(context).unfocus();
              } else {
                
              }
            });
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  Future<bool> commentConfirmed(size) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Do you really want to publish this comment?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.02,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.028,
                  ),
                  Container(
                    width: size.width * 0.7,
                    height: size.height * 0.03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          icon: Icon(
                            Icons.dangerous_outlined,
                            color: Colors.red,
                          ),
                          style: TextButton.styleFrom(
                            minimumSize:
                                Size(size.width * 0.1, size.height * 0.005),
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {
                            isCommentConfirmed = false;
                            Navigator.pop(context);
                          },
                          label: Text(
                            "NO",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: size.height * 0.02,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          icon: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          style: TextButton.styleFrom(
                            minimumSize:
                                Size(size.width * 0.1, size.height * 0.005),
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {
                            isCommentConfirmed = true;
                            Navigator.pop(
                                context); 
                          },
                          label: Text(
                            "YES",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: size.height * 0.02,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
    return isCommentConfirmed;
  }
}
