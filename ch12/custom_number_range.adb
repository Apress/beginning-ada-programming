-- custom_number_range.adb:

with Ada.Text_IO;

procedure Custom_Number_Range is
  type Unique_Decimal is range 0 .. 255;
  U_Decimal_1 : Unique_Decimal := 44;
  --U_Decimal_2 : Unique_Decimal := -8;   -- will not compile
  --U_Decimal_3 : Unique_Decimal := 1110; -- will not compile
begin
  Ada.Text_IO.Put_Line("A number: " & Unique_Decimal'Image(U_Decimal_1));
end Custom_Number_Range;
