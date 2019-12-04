-- custom_float_cast.adb:

with Ada.Float_Text_IO;
with Ada.Text_IO;

procedure Custom_Float_Cast is
  type Earth_Temp_C is delta 0.001 range -50.0 .. 100.0;
  New_York_Temp_C : Earth_Temp_C  := 20.23;
  Sahara_Temp_C : Earth_Temp_C    := 35.291;
  Reykjavik_Temp_C : Earth_Temp_C := 9.002;

  procedure Display_Temp(Temp : in Float) is
  begin
    Ada.Text_IO.Put("The temperature is : ");
    Ada.Float_Text_IO.Put(Temp, Fore => 2, Aft => 1, Exp => 0);
    Ada.Text_IO.New_Line;
  end Display_Temp;
begin
  Display_Temp(Float(New_York_Temp_C));
  Display_Temp(Float(Sahara_Temp_C));
  Display_Temp(Float(Reykjavik_Temp_C));
end Custom_Float_Cast;
