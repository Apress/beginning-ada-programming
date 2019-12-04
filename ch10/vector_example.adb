-- vector_example.adb

with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;

procedure Vector_Example is
  use type Ada.Strings.Unbounded.Unbounded_String;
  package Software_Companies_Tracker is new Ada.Containers.Vectors(
    Index_Type   => Positive,
    Element_Type => Ada.Strings.Unbounded.Unbounded_String);
  Software_Companies : Software_Companies_Tracker.Vector;

  procedure Populate_Vector(
    Vec : in out Software_Companies_Tracker.Vector) is

  begin
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("AdaCore"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("Google"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("Yahoo"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("DuckDuckGo"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("Oracle"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("SAP"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("EA"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("Id"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("Microsoft"));
    Vec.Append(New_Item => Ada.Strings.Unbounded.To_Unbounded_String("BioWare"));
  end Populate_Vector;
begin
  Populate_Vector(Software_Companies);

  -- now print out everything using a loop.
  for iter in 1 .. Software_Companies.Length loop
    Ada.Text_IO.Unbounded_IO.Put_Line(Software_Companies.Element(Index => Positive(iter)));
  end loop;
end Vector_Example;
