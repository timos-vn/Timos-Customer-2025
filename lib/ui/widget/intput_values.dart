import 'package:flutter/material.dart';
import 'package:timos_customer_2025/utils/utils.dart';

class InputValuesPage extends StatefulWidget {
  final String? note;

  const InputValuesPage({Key? key, this.note}) : super(key: key);
  @override
  _InputValuesPageState createState() => _InputValuesPageState();
}

class _InputValuesPageState extends State<InputValuesPage> {
  TextEditingController contentController = TextEditingController();

  FocusNode focusNodeContent = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contentController.text = widget.note.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              height: 350,
              width: double.infinity,
              child: Material(
                  animationDuration: Duration(seconds: 3),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    topLeft: Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Nhập lưu ý',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(focusNodeContent),
                                      child: Container(
                                        // height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: TextField(
                                          maxLines: 10,
                                          // obscureText: true,
                                          controller: contentController,
                                          decoration: new InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.all(8),
                                            hintText: 'Vui lòng nhập lưu ý',
                                            hintStyle: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey),
                                          ),
                                          // focusNode: focusNodeContent,
                                          keyboardType: TextInputType.text,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 14),
                                          //textInputAction: TextInputAction.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Center(
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'Huỷ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context,
                                        !Utils.isEmpty(contentController.text)
                                            ? contentController.text
                                            : '');
                                  },
                                  child: Text(
                                    'Đồng ý',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  )),
            ),
          ),
        ));
  }
}
