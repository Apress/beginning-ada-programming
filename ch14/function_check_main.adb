-- function_check_main.adb:

with Ada.Text_IO;

with Function_Check;

procedure Function_Check_Main is
  Result : Boolean := False;
begin
  Result := Function_Check.Evaluate("command: remove --dir \temp");

  if Result then
    Ada.Text_IO.Put_Line("The command was formatted correctly.");
  else
    Ada.Text_IO.Put_Line("The command was formatted incorrectly.");
  end if;
end Function_Check_Main;
