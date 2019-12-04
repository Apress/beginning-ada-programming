-- strings_example.adb:

with Ada.Text_IO;
with Ada.Strings;
with Ada.Strings.Fixed;

procedure strings_example is
  someVal : String := "Hello there!";
  someVal2 : String := "Hallo Kevin!";
  longString : String(1 .. 250);
  longText : String := "Hello there back!";
  -- will not compile.
  --unAssigned : String;
begin
  -- the following lines will work just fine.
  Ada.Strings.Fixed.Move(someVal, longString);
  Ada.Text_IO.Put_Line(someVal);
  Ada.Text_IO.Put_Line(longString);

  -- NOTE!! this will cause a run-time error!!
  --longString := someVal;

  -- this will work just as well.
  Ada.Strings.Fixed.Move(someVal, longText);
  Ada.Text_IO.Put_Line(longText);
  Ada.Text_IO.Put_Line(Natural'Image(longText'Length));

  -- this will work exactly as you would expect it to.
  someVal := someVal2;
  Ada.Text_IO.Put_Line(someVal);

  Ada.Strings.Fixed.Move(longString, someVal);
  Ada.Text_IO.Put_Line(someVal);

  longText := "Hallo there back!";
  Ada.Text_IO.Put_Line(longText);
end strings_example;

