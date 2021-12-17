import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'code_input_row.dart';

class CodeInputForm extends StatefulWidget {
  @override
  _CodeInputFormState createState() => _CodeInputFormState();
}

class _CodeInputFormState extends State<CodeInputForm> {
  TextEditingController _controller = TextEditingController();
  String _code = '';
  var _length = 6; //验证码长度，输入框框的个数

  @override
  void initState() {
    super.initState();
    _controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
            children: <Widget>[
              ///[CodeInputRow]其实就是上面这段注释的代码里的Row封装一下
              //验证码输入框整行，
              CodeInputRow(code: _code, length: 6),
              Opacity(
                opacity: 0,
                child: TextField(
                  //只能输入字母与数字
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z,0-9,A-Z]"))
                  ],
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  onChanged: (String str) {
                    _code = str;
                    setState(() {});
                    if (str.length == _length) {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('填入的验证码是$_code'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      ).then((v) {
                        _controller.text = '';
                        _code = '';
                        setState(() {});
                      });
                    }
                  },
                ),
              )
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
