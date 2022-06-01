import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HandleNetworking.dart';


class Page1 extends StatefulWidget {

  final String id;
  Page1(this.id);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {



  bool isPortalActive = false;
  String code = " ";
  HandleNetworking handleNetworking = HandleNetworking();


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity,),
        GestureDetector(
          onTap: () async {

            print(widget.id);
            if(!isPortalActive)
              {
                code = (await handleNetworking.openPortal(widget.id)).toString();
                if(code != null)
                  {
                    setState(() {
                      isPortalActive = true;
                    });

                    Future.delayed(Duration(seconds: 40),(){

                      setState(() {
                        isPortalActive = false;
                      });

                    });
                  }
                else
                  {
                    setState(() {
                      code = "Some error occured";
                    });

                  }

              }


          },
          child: Container(
            width: 160.0,
            height: 160.0,
            decoration:  BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isPortalActive ? "Active" : 'Open Portal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            code,
          style: TextStyle(
            color: isPortalActive ? Colors.green : Colors.red,
            fontSize: 22.0,
          ),
          ),
        ),

      ],
    );
  }
}
