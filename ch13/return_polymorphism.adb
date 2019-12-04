-- return_polymorphism.adb:

with Ada.Text_IO;

procedure Return_Polymorphism is
  function Return_Value
    return Integer is
  begin
    return 5;
  end Return_Value;

  function Return_Value
    return Float is
  begin
    return 21.9;
  end Return_Value;

  Int_Val : Integer := 0;
  Flo_Val : Float := 0.0;
begin
  Int_Val := Return_Value;
  Flo_Val := Return_Value;

  Ada.Text_IO.Put_Line("Integer: " & Integer'Image(Int_Val));
  Ada.Text_IO.Put_Line("Float:   " & Float'Image(Flo_Val));
end Return_Polymorphism;
