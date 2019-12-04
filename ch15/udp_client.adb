-- udp_client.adb:

with Ada.Text_IO;

with GNAT.Sockets;

procedure UDP_Client is
  Address : GNAT.Sockets.Sock_Addr_Type := (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr("127.0.0.1"), 50000);
  Socket  : GNAT.Sockets.Socket_Type;
  Channel : GNAT.Sockets.Stream_Access;

  Data : String := "Hello world!";
begin
  GNAT.Sockets.Create_Socket(Socket, GNAT.Sockets.Family_Inet, GNAT.Sockets.Socket_Datagram);
  GNAT.Sockets.Connect_Socket(Socket, Address);
  Channel := GNAT.Sockets.Stream(Socket);

  String'Write(Channel, Data);

  GNAT.Sockets.Close_Socket(Socket);
end UDP_Client;
