import 'package:socket_io_client/socket_io_client.dart' as IO;

/*In simple words, the singleton pattern ensures that there is only one instance 
of a class in the entire program. This can be useful for a variety of reasons*/
class SocketClient {
  static SocketClient? _instance;

  // The Socket.IO socket for communication
  IO.Socket? socket;

/* private constructor for the SocketClient class. It is marked as private by using an underscore before its name, meaning it can only be called from within the class and not from outside. This constructor is responsible for initializing the socket variable and connecting it to the Socket.IO server with specific options. It sets the transport method to 'websocket' and autoConnect to 'false'. */

// Private constructor to create the SocketClient instance
  SocketClient._internal() {
    // Initialize the Socket.IO connection with desired options
    socket = IO.io('http://192.168.0.104:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': 'false',
    });
    // Connect the socket to the server
    socket!.connect();
  }

/* This is a static getter method called instance. The static getter methods can be accessed without creating an instance of the class. This method is the key to implementing the Singleton pattern. It is responsible for providing the single instance of the SocketClient class. */

// Public static method to get the single instance of SocketClient
  static SocketClient get instance {
    // If the instance is not created yet, create a new one
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}

/* Here's how it works:

If _instance is null, meaning no instance of SocketClient has been created yet, it creates a new instance using the private constructor SocketClient._internal().
If _instance is not null, it means an instance already exists, so it returns the existing instance. 

*/
