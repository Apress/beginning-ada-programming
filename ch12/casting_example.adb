-- casting_example.adb:

with Ada.Text_IO;

procedure Casting_Example is
  type Custom_Int is range -10 .. 10;
  Val1 : Custom_Int := 0;
  Val2 : Integer    := -9;
  Val3 : Positive   := 1;
  Val4 : Natural    := 0;
begin
  Val1 := Custom_Int(Val2);
  Ada.Text_IO.Put_Line("Val1 now: " & Custom_Int'Image(Val1));
  Val1 := 8;
  Val3 := Positive(Val1);
  Ada.Text_IO.Put_Line("Val3 now: " & Positive'Image(Val3));
  Val4 := Positive(Val1);
  Val4 := Natural(Val1);
  Ada.Text_IO.Put_Line("Val4 now: " & Positive'Image(Val4));

  -- how to cast when you do not know if the variable is in range.
  Test_Block :
  declare
  begin
    Val1 := 0;

    Val3 := Positive(Val1);
    Ada.Text_IO.Put_Line("Val3 the second time: " & Positive'Image(Val3));
  exception
    when Constraint_Error =>
      Ada.Text_IO.Put_Line("ERROR: A value is out of range!");
    when others =>
      Ada.Text_IO.Put_Line("ERROR: An another error was discovered.");
  end Test_Block;

  Ada.Text_IO.Put_Line("Val3 the second time: " & Positive'Image(Val3));
end Casting_Example;
