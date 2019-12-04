-- floats_ranges.adb:

with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure floats_ranges is
  Sum1Float : Float := 53.98;
  Sum2Float : Float := 94.22;
  Total : Float     := 0.0;
begin
  Ada.Text_IO.Put_Line("The min range of a float [" &
    Float'Image(Float'First)
    & "] and the max range of a float [" &
    Float'Image(Float'Last) & "].");

  Total := Sum1Float + Sum2Float;

  Ada.Text_IO.Put_Line("The total of the two sums: " &
    Float'Image(Total));
  Ada.Float_Text_IO.Put(Total, Exp => 0);
end floats_ranges;

