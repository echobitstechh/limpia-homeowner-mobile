import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/chat_notifier.dart';
import '../../../core/utils/config.dart';
import '../../../state.dart';



class ChatDetailPage extends StatefulWidget {
  final String driverName;
  final String driverId;
  final String rideId;
  ChatDetailPage({
    required this.driverName,
    required this.driverId,
    required this.rideId,
  });
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}
class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _messageController = TextEditingController();
  //late SocketService socketService;
  //late MessageProvider messageProvider;
  @override
  void initState() {
    super.initState();
    // Any non-provider related initializations can still be done here
  }
  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Initialize your providers here
  //   socketService = Provider.of<SocketService>(context, listen: true);
  //   messageProvider = Provider.of<MessageProvider>(context, listen: false);
  //   _connectToSocket(socketService);
  // }
  // void _connectToSocket(SocketService socketService) {
  //   socketService.initSocket(AppConfig.baseUrl, {
  //     'userId': profile.value.user?.userId,
  //     'userType': 'user', // 'driver' or 'user'
  //   }, () {
  //     if (socketService.isConnected) {
  //       socketService.emit('userConnected', {
  //         'userId': profile.value.user?.userId,
  //       });
  //       socketService.on('receiveMessage', (data) {
  //         print('received message is: $data');
  //         if (mounted) {
  //           // Add received message to the message provider
  //           messageProvider.addMessage(data['message'], false);
  //         }
  //       });
  //     } else {
  //       print("Socket is not connected, cannot request ride.");
  //     }
  //   });
  // }
  // void sendMessage() {
  //   String message = _messageController.text;
  //   if (message.isNotEmpty) {
  //     socketService.emit('sendMessage', {
  //       'senderId': profile.value.user?.userId,
  //       'receiverId': widget.driverId,
  //       'message': message,
  //       'userType': 'user'
  //     });
  //     messageProvider.addMessage(message, true);
  //     _messageController.clear();
  //   }
  // }
  @override
  void dispose() {
    _messageController.dispose(); // Dispose of the controller
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with ${widget.driverName}"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/call.svg',
              width: 23.0,
              height: 20.0,
              color: Colors.black,
            ),
            onPressed: () {
              // Define your call action or navigation here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              //itemCount: messageProvider.messages.length,
              itemBuilder: (context, index) {
              //  bool isMe = messageProvider.messages[index].isMe;
                return Align(
                  //alignment: isMe
                    //  ? Alignment.centerRight
                     // : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16),
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      //isMe ? Colors.black87 : Colors.grey.shade300,
                     // borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "hello Amrah"
                      //style: TextStyle(
                       // color: isMe ? Colors.white : Colors.black87,
                      ),
                    ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white), onPressed: () {  },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}