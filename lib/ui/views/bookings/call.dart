import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/ui_helpers.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text("Call Client"),
      //   leading: InkWell(
      //     child: Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Icon(Icons.cancel_outlined)
      //     ),
      //     onTap: () { Navigator.pop(context);},
      //   ),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/blur.png'), // Path to your image
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [InkWell(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.cancel_outlined)
                    ),
                    onTap: () { Navigator.pop(context);},
                  ),
                ],
              ),
              verticalSpaceSmall,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          '',
                          width: 56.0,
                          height: 56.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  horizontalSpaceSmall,
                  Column(
                    children: [
                      Text(
                        "John Smith",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        "connecting...",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          'assets/images/endcall.svg',
                          width: 56.0,
                          height: 56.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          'assets/images/calling.svg',
                          width: 52.0,
                          height: 52.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              verticalSpaceMedium,
              verticalSpaceMedium,
              InkWell(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      '',
                      width: 66.0,
                      height: 66.0,
                    ),
                  ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
