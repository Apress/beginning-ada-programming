-- tcp_server.adb:

with Ada.Text_IO;
with Ada.IO_Exceptions;

with GNAT.Sockets;

procedure UDP_Server is
  Receiver   : GNAT.Sockets.Socket_Type;
  Channel    : GNAT.Sockets.Stream_Access;

  Server_Data : String := "            ";
begin
  GNAT.Sockets.Create_Socket(Receiver, GNAT.Sockets.Family_Inet, GNAT.Sockets.Socket_Datagram);
  GNAT.Sockets.Set_Socket_Option(Receiver, GNAT.Sockets.Socket_Level, (GNAT.Sockets.Reuse_Address, True));
  GNAT.Sockets.Bind_Socket(Receiver, (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr("127.0.0.1"), 50000));

  Ada.Text_IO.Put_Line(" !! UDP Server started !!");

  loop
    Channel := GNAT.Sockets.Stream(Receiver);

    begin
      loop
        Ada.Text_IO.Put(" Received message: ");
        String'Read(Channel, Server_Data);
        Ada.Text_IO.Put(Server_Data);
        Ada.Text_IO.New_Line;
      end loop;
    exception
      when GNAT.Sockets.Socket_Error =>
        exit;
    end;
  end loop;
end UDP_Server;
