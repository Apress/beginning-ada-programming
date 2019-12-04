-- records_array.adb:

with Ada.Strings.Unbounded;
with Ada.Float_Text_IO;
with Ada.Text_IO;

procedure records_array is
  type Bird is record
    BirdName : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    AverageWeight : Float                             := 0.0;
    AverageWingSpan : Float                           := 0.0;
    Migrating : Boolean                               := False;
  end record;

  Birds : array(1 .. 3) of Bird;
begin
  -- instantiate some values.
  Birds(1).BirdName        := Ada.Strings.Unbounded.To_Unbounded_String("Canadian Goose");
  Birds(1).AverageWeight   := 7.5;
  Birds(1).AverageWingspan := 160.0;
  Birds(1).Migrating       := True;
  Birds(2).BirdName        := Ada.Strings.Unbounded.To_Unbounded_String("Sparrow");
  Birds(2).AverageWeight   := 0.03;
  Birds(2).AverageWingspan := 0.15;
  Birds(3).BirdName        := Ada.Strings.Unbounded.To_Unbounded_String("Finch");
  Birds(3).AverageWeight   := 0.047;
  Birds(3).AverageWingspan := 0.17;

  for iter in Birds'Range loop
    Ada.Text_IO.Put_Line(" Bird name: " & Ada.Strings.Unbounded.To_String(Birds(iter).BirdName));
    Ada.Text_IO.Put("  Average weight:   ");
    Ada.Float_Text_IO.Put(Birds(iter).AverageWeight, Aft => 3, Exp => 0);
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put("  Average wingspan: ");
    Ada.Float_Text_IO.Put(Birds(iter).AverageWingspan, Aft => 2, Exp => 0);
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put_Line("  Migrating bird:    " & Boolean'Image(Birds(iter).Migrating));

    Ada.Text_IO.New_Line;
  end loop;
end records_array;

