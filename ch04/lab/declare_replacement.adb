-- declare_replacement.adb:

with Ada.Text_IO;

procedure declare_replacement is
  procedure declare_substitute(Counter : in out Natural) is
    Bool : Boolean := True;
  begin
    Counter := 3;
    Ada.Text_IO.Put_Line(" Inside the declare: " & Natural'Image(Counter));
    Ada.Text_IO.Put_Line(" The boolean:        " & Boolean'Image(Bool));
  end declare_substitute;

  Counter : Natural := 0;
begin
  Ada.Text_IO.Put_Line("Right before the declare: " & Natural'Image(Counter));

  declare_substitute(Counter);

  -- WARNING: The below will not compile.
  --Ada.Text_IO.Put_Line("The boolean after declare: " & Natural'Image(Bool));

  Ada.Text_IO.Put_Line("Right after the declare: " & Natural'Image(Counter));
end declare_replacement;

