import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {

  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/icon_head.jpg'),
          ),
          Expanded(
            child: Container(
                height: 35,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  autofocus: false,
                  //自动聚焦，闪游标
                  // controller: _controller,
                  cursorColor: Colors.blue,
                  maxLines: 1,
                  decoration: InputDecoration(
                      //输入框装饰
                      filled: true,
                      //填满
                      fillColor: Color(0xffF3F6F9),
                      //白色
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      //前标
                      contentPadding: EdgeInsets.only(right: 0),
                      //调整文字边距
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none, //去边线
                        borderRadius: BorderRadius.all(Radius.circular(35 / 2)),
                      ),
                      hintText: "搜索文章",
                      //提示
                      hintStyle: TextStyle(fontSize: 14) //提示样式
                      ),
                  onChanged: (String name) {},

                  // onChanged: (str) => BlocProvider.of<SearchBloc>(context)
                  //     .add(SearchWidgetEvent(args:SearchArgs(name: str,stars: [1,2,3,4,5]))),

                  onSubmitted: (str) {
                    //提交后
                    FocusScope.of(context).requestFocus(FocusNode()); //收起键盘
//            _controller.clear();
                  },
                )),
          ),
          Icon(Icons.addchart_sharp),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(35 + 8 * 2);
}
