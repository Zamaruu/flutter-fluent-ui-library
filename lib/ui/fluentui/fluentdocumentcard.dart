import 'package:flutter/material.dart';

class DocumentCard extends StatefulWidget {
  final double height;
  final double width;
  final String filetitle;
  final String createdDate;
  final String creatorFirstName;
  final String creatorLastName;
  final String imgURL;
  final String imgAsset;
  final Function onPressed;

  const DocumentCard(
    this.filetitle, 
    this.creatorFirstName, 
    this.creatorLastName,
    {
      Key key,
      this.createdDate = "23.03.2021", 
      this.imgURL, 
      this.imgAsset, 
      this.onPressed, 
      this.height = 250, 
      this.width = 250,
    }
  ) : super(key: key);

  @override
  _DocumentCardState createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {
  bool _isNetworkImage = false;
  bool _isAssetImage = false;
  bool _isFile = false;

  double _borderRadius = 1.0;
  double _borderWidth = 0.5;

  IconData _fileIcon;
  Color _borderColor = Colors.black;
  Container _teaserImage;

  @override
  void initState() {
    super.initState();
    if(widget.imgURL != null){
      _isNetworkImage = true;
      _fileIcon = Icons.image;
      _teaserImage = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.imgURL),
            fit:  BoxFit.fill
          )
        )
      );
    }
    else if(widget.imgAsset != null){
      _isAssetImage = true;
      _fileIcon = Icons.image;
      _teaserImage = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.imgAsset),
            fit:  BoxFit.fill
          )
        )
      );
    }
    else{
      _isFile = true;
      _fileIcon = Icons.file_present;
      _teaserImage = Container(
        color: Colors.blue,
        child: Center(
          child: Icon(Icons.file_copy_sharp, color: Colors.white, size: 40,),
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: widget.width,
      height: widget.height,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
        color: Colors.white,
      ),
      child: new Material(
        child: new InkWell(
          onTap: widget.onPressed != null? widget.onPressed: () {},
          onHover: (onHover){
            if (onHover) {
              setState(() {
                _borderWidth = 2;
                _borderColor = Colors.grey;
              });
            } else {
              setState(() {
                _borderWidth = 0.5;
                _borderColor = Colors.black;
              });
            }
          },
          child: new Container(
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Stack(
                    children: [
                      _teaserImage != null?
                        _teaserImage:
                        Container(
                          color: Colors.blue,
                          child: Center(
                            child: Icon(Icons.broken_image, color: Colors.white, size: 40,),
                          ),
                        ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.bottomLeft,
                        child: Icon(_fileIcon,  color: Colors.white,),
                      )
                    ],
                  )
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(
                            widget.filetitle,
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[600],
                                  radius: 15,
                                  child: Center(
                                    child: Text(
                                      widget.creatorFirstName[0].toUpperCase() + widget.creatorLastName[0].toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.creatorFirstName} ${widget.creatorLastName}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12
                                    ),
                                  ),
                                  Text(
                                    "Erstellt am ${widget.createdDate}",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}