-- trucking_company.adb:

with Ada.Text_IO;

procedure trucking_company is
  Oil_Change : Positive := 440;
  Washing_Fluid : Float := 98.4;
  Air_Filter : Positive := 23;
  Fuel1 : Float         := 900.40;
  Pizza : Float         := 71.49;
  Fuel2 : Float         := 90.01;
  Total : Float         := 0.0;
begin
  Ada.Text_IO.Put_Line(" Oil Change    : " & Positive'Image(Oil_Change));
  Ada.Text_IO.Put_Line(" Washing Fluid : " & Float'Image(Washing_Fluid));
  Ada.Text_IO.Put_Line(" Air Filter    : " & Positive'Image(Air_Filter));
  Ada.Text_IO.Put_Line(" Fuel          : " & Float'Image(Fuel1));
  Ada.Text_IO.Put_Line(" Pizza         : " & Float'Image(Pizza));
  Ada.Text_IO.Put_Line(" Fuel          : " & Float'Image(Fuel2));
  Ada.Text_IO.Put_Line(" ---------------------------------");
  Total := Washing_Fluid + Fuel1 + Pizza + Fuel2 + Float(Oil_Change) + Float(Air_Filter);
  Ada.Text_IO.Put_Line(" Total         : " & Float'Image(Total));
end trucking_company;

