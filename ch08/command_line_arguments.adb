-- command_line_arguments.adb:

with Ada.Command_Line;
with Ada.Text_IO;

procedure Command_Line_Arguments is
begin
  -- this will print out the name of the application.
  Ada.Text_IO.Put_Line("Application name and path: " & Ada.Command_Line.Command_Name);

  for Arg in 1 .. Ada.Command_Line.Argument_Count loop
    Ada.Text_IO.Put_Line(Ada.Command_Line.Argument(Arg) & " ");
  end loop;
end Command_Line_Arguments;
