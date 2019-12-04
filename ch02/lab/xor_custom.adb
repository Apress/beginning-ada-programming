-- xor_custom.adb:

with Ada.Text_IO;

procedure xor_custom is
  Result : Boolean := True;
begin
  Ada.Text_IO.Put_Line("True  XOR True  = " & Boolean'Image((True or True) and not (True and True)));
  Ada.Text_IO.Put_Line("True  XOR False = " & Boolean'Image((True or False) and not (True and False)));
  Ada.Text_IO.Put_Line("False XOR True  = " & Boolean'Image((False or True) and not (False and True)));
  Ada.Text_IO.Put_Line("False XOR False = " & Boolean'Image((False or False) and not (False and False)));
end xor_custom;

