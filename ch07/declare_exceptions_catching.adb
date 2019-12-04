-- declare_exceptions_catching.adb:

with Ada.Text_IO;

procedure Declare_Exceptions_Catching is
  Val1 : Integer := 45;
  Val2 : Integer := 0;
begin
  Ada.Text_IO.Put_Line("Getting started with cathing exceptions!");

  declare
  begin
    Ada.Text_IO.Put_Line("Before division by 0.");

    Val1 := Val1 / Val2;

    Ada.Text_IO.Put_Line("After division by 0.");
  exception
    when Constraint_Error =>
      Ada.Text_IO.Put_Line("ERROR: Division by 0.");
    when others =>
      Ada.Text_IO.Put_Line("ERROR: I don't know what it is though...");
  end;

  Ada.Text_IO.Put_Line("Continuation and such!");
end Declare_Exceptions_Catching;
