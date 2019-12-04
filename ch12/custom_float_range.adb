-- custom_float_range.adb:

with Ada.Text_IO;

procedure Custom_Float_Range is
  type Custom_Float is delta 0.001 range -1.0 .. 1.0;
  Val1 : Custom_Float := 0.0;
  Val2 : Custom_Float := 0.5;
  Val3 : Custom_Float := -0.5;
  Val4 : Custom_Float := -0.005;
  -- INCORRECT: value has extraneous low order digits
  --Val5 : Custom_Float := 0.0000001;
  -- INCORRECT: range low bound too small for digits value
  --Val6 : Custom_Float := -2.0;
begin
  Ada.Text_IO.Put_Line("Val1: " & Custom_Float'Image(Val1));
  Ada.Text_IO.Put_Line("Val2: " & Custom_Float'Image(Val2));
  Ada.Text_IO.Put_Line("Val3: " & Custom_Float'Image(Val3));
  Ada.Text_IO.Put_Line("Val4: " & Custom_Float'Image(Val4));
end Custom_Float_Range;
