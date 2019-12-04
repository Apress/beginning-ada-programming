-- exceptions_catching.adb:

with Ada.Text_IO;

procedure Exceptions_Catching is
  Val1 : Integer := 45;
  Val2 : Integer := 0;
begin
  Ada.Text_IO.Put_Line("Before division by 0.");

  Val1 := Val1 / Val2;

  Ada.Text_IO.Put_Line("After division by 0.");
exception
  when Constraint_Error =>
    Ada.Text_IO.Put_Line("ERROR: Division by 0.");
  when others =>
    Ada.Text_IO.Put_Line("ERROR: I don't know what it is though...");
end Exceptions_Catching;
