-- concat_string.adb:

with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

procedure Concat_String is
  First_Name : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("John");
  Last_Name : Ada.Strings.Unbounded.Unbounded_String  := Ada.Strings.Unbounded.To_Unbounded_String("Campbell");
  Result : Ada.Strings.Unbounded.Unbounded_String     := Ada.Strings.Unbounded.Null_Unbounded_String;
begin
  -- first concatenate the string in question.
  Result := First_Name;
  Ada.Strings.Unbounded.Append(Result, " ");
  Ada.Strings.Unbounded.Append(Result, Last_Name);

  Ada.Text_IO.Unbounded_IO.Put_Line(Result);

  -- now, I want to print out only "John C."
  Result := Ada.Strings.Unbounded.Unbounded_Slice(Result, 1, 6);
  Ada.Strings.Unbounded.Append(Result, ".");
  Ada.Text_IO.Unbounded_IO.Put_Line(Result);
end Concat_String;
