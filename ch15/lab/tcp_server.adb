-- tcp_server.adb:

with Ada.Text_IO;
with Ada.Streams;
with Ada.IO_Exceptions;

with GNAT.Sockets;

procedure TCP_Server is
  Receiver           : GNAT.Sockets.Socket_Type    := GNAT.Sockets.No_Socket;
  Communication_Sock : GNAT.Sockets.Socket_Type    := GNAT.Sockets.No_Socket;
  Client_Addr        : GNAT.Sockets.Sock_Addr_Type := GNAT.Sockets.No_Sock_Addr;
  Channel            : GNAT.Sockets.Stream_Access;

  use type Ada.Streams.Stream_Element_Offset;
  Offset             : Ada.Streams.Stream_Element_Offset;
  Data               : Ada.Streams.Stream_Element_Array (1 .. 256);
begin
  GNAT.Sockets.Initialize;
  GNAT.Sockets.Create_Socket(Receiver, GNAT.Sockets.Family_Inet, GNAT.Sockets.Socket_Stream);
  GNAT.Sockets.Set_Socket_Option(Receiver, GNAT.Sockets.Socket_Level, (GNAT.Sockets.Reuse_Address, True));
  GNAT.Sockets.Bind_Socket(Receiver, (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr("127.0.0.1"), 50000));
  GNAT.Sockets.Listen_Socket(Receiver);

  Ada.Text_IO.Put_Line(" !! TCP Server started !!");

  loop
    GNAT.Sockets.Accept_Socket(Receiver, Communication_Sock, Client_Addr);

    Ada.Text_IO.Put_Line("Client connected from " & GNAT.Sockets.Image(Client_Addr));
    Channel := GNAT.Sockets.Stream(Communication_Sock);

    begin
      Ada.Text_IO.Put(" Received message: ");

      loop
        Ada.Streams.Read(Channel.All, Data, Offset);
        exit when Offset = 0;

        for I in 1 .. Offset loop
          Ada.Text_IO.Put(Character'Val(Data (I)));
        end loop;
      end loop;

      Ada.Text_IO.New_Line;
    exception
      when GNAT.Sockets.Socket_Error =>
        Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error, " ERROR: An error was encountered!");
    end;

    GNAT.Sockets.Close_Socket(Communication_Sock);
  end loop;
end TCP_Server;
