-- tcp_server.adb:

with Ada.Text_IO;
with Ada.IO_Exceptions;

with GNAT.Sockets;

procedure TCP_Server is
  Receiver   : GNAT.Sockets.Socket_Type;
  Connection : GNAT.Sockets.Socket_Type;
  Client     : GNAT.Sockets.Sock_Addr_Type;
  Channel    : GNAT.Sockets.Stream_Access;

  Server_Data : constant String := "I like cake!";
  Server_Data2 : String := "            ";
begin
  GNAT.Sockets.Create_Socket(Receiver, GNAT.Sockets.Family_Inet, GNAT.Sockets.Socket_Stream);
  GNAT.Sockets.Set_Socket_Option(Receiver, GNAT.Sockets.Socket_Level, (GNAT.Sockets.Reuse_Address, True));
  GNAT.Sockets.Bind_Socket(Receiver, (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr("127.0.0.1"), 50000));
  GNAT.Sockets.Listen_Socket(Receiver);

  Ada.Text_IO.Put_Line(" !! TCP Server started !!");

  loop
    GNAT.Sockets.Accept_Socket(Receiver, Connection, Client);

    Ada.Text_IO.Put_Line("Client connected from " & GNAT.Sockets.Image(Client));
    Channel := GNAT.Sockets.Stream(Connection);

    begin
      loop
        String'Read(Channel, Server_Data2);
        String'Write(Channel, Server_Data);
      end loop;
    exception
      when Ada.IO_Exceptions.End_Error =>
        null;
    end;

    GNAT.Sockets.Close_Socket(Connection);
  end loop;
end TCP_Server;
