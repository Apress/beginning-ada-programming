-- hello_world_methods.adb:

with Ada.Text_IO;

procedure hello_world_methods is
  procedure string1 is
  begin
    Ada.Text_IO.Put_Line("###############################################################");
  end string1;

  procedure string2 is
  begin
    Ada.Text_IO.Put_Line("##                                                           ##");
  end string2;

  procedure string3 is
  begin
    Ada.Text_IO.Put_Line("##       00000000000   0000000000    00000000000             ##");
  end string3;

  procedure string4 is
  begin
    Ada.Text_IO.Put_Line("##       00       00   00       00   00       00             ##");
  end string4;

  procedure string5 is
  begin
    Ada.Text_IO.Put_Line("##       00000000000   00       00   00000000000             ##");
  end string5;

  procedure string6 is
  begin
    Ada.Text_IO.Put_Line("##       00       00   0000000000    00       00             ##");
  end string6;
begin
  string1;
  string1;
  string2;
  string3;
  string4;
  string4;
  string5;
  string4;
  string6;
  string2;
  string1;
  string1;
end hello_world_methods;

