import 'package:fluent_ui_design/ui/fluentui/fluentuimodels.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

PopupMenuItem _popupItem(CommandBarButtonModel menuButton) {
  return PopupMenuItem(
    child: GestureDetector(
      onTap: menuButton.onPressed ?? () {},
      child: Container(
        margin: EdgeInsets.only(right:  15),
        child: Row(
          children: [
            Icon(
              menuButton.icon,
              size: 24,
              color: Colors.blue[700],
            ),
            SizedBox(width: 7),
            Text(
              menuButton.title,
              style: TextStyle(
                color: Colors.grey[900], fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class DefaultButton extends StatelessWidget {
  final double borderradius = 1.0;
  final bool border;

  final String title;
  final IconData icon;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final Widget leading;

  final BoxDecoration buttondecoration = new BoxDecoration(
    borderRadius: BorderRadius.circular(5),
  );

  DefaultButton(this.title,
      {Key key,
      this.icon,
      this.onPressed,
      this.color = const Color.fromRGBO(0, 120, 212, 1),
      this.textColor = Colors.white,
      this.border = false,
      this.borderColor,
      this.leading})
      : super(key: key);

  DefaultButton.standard(this.title,
      {Key key,
      this.icon,
      this.onPressed,
      this.color = Colors.white,
      this.textColor = const Color.fromRGBO(64, 63, 62, 1),
      this.border = true,
      this.borderColor = Colors.black,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius),
        border: (() {
          if (border) {
            return Border.all(
              color: Colors.black,
              width: 0.5,
            );
          }
        }()),
        color: color,
      ),
      child: new Material(
        child: new InkWell(
          onTap: onPressed != null ? onPressed : () {},
          child: Row(
            children: [
              leading != null ? leading : Container(),
              leading != null
                  ? SizedBox(
                      width: 5,
                      child: Center(
                        child: Container(
                          color: textColor,
                          height: 25,
                          width: 1.5,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon != null
                        ? Icon(
                            icon,
                            color: textColor,
                          )
                        : Container(),
                    Container(
                      margin: EdgeInsets.only(left: icon != null ? 5 : 0),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}

class CompoundButton extends StatelessWidget {
  final double borderradius = 1.0;
  final bool border;

  final String title;
  final String secondary;
  final Function onPressed;
  final Color color;
  final Color titleColor;
  final Color borderColor;
  final Color secondaryColor;

  final BoxDecoration buttondecoration = new BoxDecoration(
    borderRadius: BorderRadius.circular(5),
  );

  CompoundButton(this.title, this.secondary,
      {Key key,
      this.onPressed,
      this.color = const Color.fromRGBO(0, 120, 212, 1),
      this.titleColor = Colors.white,
      this.border = false,
      this.borderColor,
      this.secondaryColor = Colors.white})
      : super(key: key);

  CompoundButton.standard(this.title, this.secondary,
      {Key key,
      this.onPressed,
      this.color = Colors.white,
      this.titleColor = const Color.fromRGBO(94, 93, 93, 1),
      this.border = true,
      this.borderColor = Colors.black,
      this.secondaryColor = const Color.fromRGBO(64, 63, 62, 1)});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius),
        border: (() {
          if (border) {
            return Border.all(
              color: Colors.black,
              width: 0.5,
            );
          }
        }()),
        color: color,
      ),
      child: new Material(
        child: new InkWell(
          onTap: onPressed != null ? onPressed : () {},
          child: new Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    secondary,
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 11,
                        letterSpacing: 0.3),
                  ),
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

class CommandBarButton extends StatelessWidget {
  final double borderradius = 1.0;
  final bool border;

  final String title;
  final IconData icon;
  final IconData trailingIcon;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;

  final BoxDecoration buttondecoration = new BoxDecoration(
    borderRadius: BorderRadius.circular(5),
  );

  CommandBarButton(this.title, this.icon,
      {Key key,
      this.onPressed,
      this.color = Colors.white,
      this.textColor = const Color.fromRGBO(64, 63, 62, 1),
      this.border = true,
      this.borderColor = Colors.black, this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius),
        color: Colors.transparent,
      ),
      child: new Material(
        child: new InkWell(
          onTap: onPressed != null ? onPressed : () {},
          child: new Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: Colors.blue,
                        size: 20,
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.only(left: icon != null ? 5 : 0),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3),
                  ),
                ),
                trailingIcon != null
                    ? Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Icon(
                          trailingIcon,
                          color: Colors.grey[600],
                        ))
                    : Container()
              ],
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}

class SplitButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Function onPressed;
  final List<CommandBarButtonModel> menuButtons;
  
  List<PopupMenuItem> _menuButtons = [];

  SplitButton(this.title, this.menuButtons,
      {Key key,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.blue, 
      this.onPressed, 
      })
      : super(key: key);

  void _initMenuButtons(){
    for (CommandBarButtonModel button in menuButtons) {
      _menuButtons.add(_popupItem(button));
    }
  }

  @override
  Widget build(BuildContext context) {
    _initMenuButtons();
    return DefaultButton(title,
      textColor: textColor,
      onPressed: onPressed,
      leading: Container(
        child: PopupMenuButton(
          icon: Icon(Icons.keyboard_arrow_down, color: textColor),
          offset: Offset(0, 40),
          itemBuilder: (context) => _menuButtons
        ),
      )
    );
  }
}

class CommandBarPopUpButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final GlobalKey _menuKey = new GlobalKey();
  final IconData trailingIcon = Icons.keyboard_arrow_down;
  final List<CommandBarButtonModel> menuButtons;
  
  List<PopupMenuItem> _menuButtons = [];

  CommandBarPopUpButton(
    this.title,
    this.menuButtons,
    {
      Key key,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.blue,
    }
  ) : super(key: key);

  void _initMenuButtons(){
    for (CommandBarButtonModel button in menuButtons) {
      _menuButtons.add(_popupItem(button));
    }
  }

  @override
  Widget build(BuildContext context) {
    _initMenuButtons();
    return PopupMenuButton(
      key: _menuKey,
      child: CommandBarButton(
        title,
        Icons.access_alarm,
        trailingIcon: trailingIcon,
        onPressed: () {
          dynamic state = _menuKey.currentState;
          state.showButtonMenu();
        },
      ),
      offset: Offset(0, 40),
      elevation: 0,
      itemBuilder: (context) => _menuButtons,
    );
  }
}

class ActionButton extends StatefulWidget {
  final String title;
  final IconData leadingIcon;
  final IconData traillingIcon;
  final Function onPressed;

  const ActionButton(this.title, this.leadingIcon,
      {Key key, this.traillingIcon, this.onPressed})
      : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  Color _textColor = Colors.black;
  Color _iconColor = Colors.blue[700];

  onHover(PointerHoverEvent onHover) {
    setState(() {
      _textColor = Colors.blue;
      _iconColor = Colors.blue;
    });
  }

  onExit(PointerExitEvent onExit) {
    setState(() {
      _textColor = Colors.black;
      _iconColor = Colors.blue[700];
    });
  }

  onEnter(PointerEnterEvent onEnter){
    setState(() {
      _textColor = Colors.black;
      _iconColor = Colors.blue[700];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        onHover: onHover,
        onExit: onExit,
        child: InkWell(
          onTap: widget.onPressed ?? () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Icon(
                      widget.leadingIcon,
                      color: _iconColor,
                    )),
                Text(
                  widget.title,
                  style: TextStyle(color: _textColor),
                ),
                widget.traillingIcon != null
                    ? Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Icon(
                          widget.traillingIcon,
                          color: Colors.grey[600],
                        ))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
