-- limited_type.adb:

with Ada.Text_IO;

procedure Limited_Type is
  type New_Integer is limited record
    Tracking_Number : Integer := 0;
  end record;

  Val1 : New_Integer;
  Val2 : New_Integer;
begin
  if Val1 = Val2 then
    Ada.Text_IO.Put_Line("They're equal!");
  end if;
end Limited_Type;
