-- limited_string.adb:

procedure Limited_String is
  subtype Menu_Selection_Value is String(1 .. 2);
  Value1 : Menu_Selection_Value := (others => ' ');
begin
  null;
end Limited_String;
