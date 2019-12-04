-- declare_block.adb:

with Ada.Text_IO;

procedure declare_block is
  Counter : Natural := 0;
begin
  Ada.Text_IO.Put_Line("Right before the declare: " & Natural'Image(Counter));

  declare
    Bool : Boolean := True;
  begin
    Counter := 3;
    Ada.Text_IO.Put_Line(" Inside the declare: " & Natural'Image(Counter));
    Ada.Text_IO.Put_Line(" The boolean:        " & Boolean'Image(Bool));
  end;

  --Ada.Text_IO.Put_Line("The boolean after declare: " & Natural'Image(Bool));
  Ada.Text_IO.Put_Line("Right after the declare: " & Natural'Image(Counter));
end declare_block;

