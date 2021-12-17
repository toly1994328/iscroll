import 'square_input_cell.dart';
import 'underline_input_cell.dart';
import 'package:flutter/material.dart';


enum CodeInputType{
  squareBox,  //方框类型
  underLine   //下划线类型
}

class CodeInputRow extends StatefulWidget{
  ///[code]已经输入验证码 [length]需要几个框，即规定的验证码的长度
  final String code;
  final int length;
  final CodeInputType type;
  const CodeInputRow({Key? key, this.code='', this.length= 6, this.type=CodeInputType.squareBox}) : super(key: key);

  @override
  _CodeInputRowState createState() => _CodeInputRowState();
}

class _CodeInputRowState extends State<CodeInputRow> {
  List<Widget> _cells = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _newCells = [];
    if(widget.type == CodeInputType.squareBox){
      for(int i = 1;i<=widget.length;i++){
        _newCells.add(
            SquareInputCell(
                isFocused: widget.code.length == i-1,
                text: widget.code.length>=i?widget.code.substring(i-1,i):''));
      }
    }else{
      for(int i = 1;i<=widget.length;i++){
        _newCells.add(
            UnderlineInputCell(
                isFocused: widget.code.length == i-1,
                text: widget.code.length>=i?widget.code.substring(i-1,i):''));
      }
    }

    _cells=_newCells;
    return Row(
      mainAxisAlignment: widget.length==4?MainAxisAlignment.spaceEvenly:MainAxisAlignment.spaceBetween,
      children: _cells,
    );
  }


}