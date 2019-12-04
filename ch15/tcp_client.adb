-- tcp_client.adb:

with Ada.Text_IO;
with Ada.Strings.Unbounded;

with GNAT.Sockets;

procedure TCP_Client is
  Address : GNAT.Sockets.Sock_Addr_Type := (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr("127.0.0.1"), 50000);
  Socket  : GNAT.Sockets.Socket_Type;
  Channel : GNAT.Sockets.Stream_Access;

  Data : String := "Hello world!";
begin
  GNAT.Sockets.Create_Socket(Socket);
  GNAT.Sockets.Connect_Socket(Socket, Address);
  Channel := GNAT.Sockets.Stream(Socket);

  String'Write(Channel, Data);
  String'Read(Channel, Data);
  Ada.Text_IO.Put_Line(" Data received: " & Data);

  GNAT.Sockets.Close_Socket(Socket);
end TCP_Client;
