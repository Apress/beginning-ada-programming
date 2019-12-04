-- generic_main.adb:

with Ada.Text_IO;

with Gener;

procedure Generic_Main is
  type Some_Int is range 0 .. 5000;
  type Some_Float is new Float range -5.0 .. 125.0;
  package Generic_Package_Test is new Gener(Some_Int, Some_Float);

  procedure Put_Line_Int(
    Val1 : in Some_Int;
    Val2 : in Some_Int) is

  begin
    Ada.Text_IO.Put_Line("Val1: " & Some_Int'Image(Val1) &
      "  Val2: " & Some_Int'Image(Val2));
  end Put_Line_Int;

  procedure Put_Line_Int(
    Val : in Some_Int) is

  begin
    Ada.Text_IO.Put_Line("Val: " & Some_Int'Image(Val));
  end Put_Line_Int;

  procedure Put_Line_Flo(
    Val1 : in Some_Float;
    Val2 : in Some_Float) is

  begin
    Ada.Text_IO.Put_Line("Val1: " & Some_Float'Image(Val1) &
      "  Val2: " & Some_Float'Image(Val2));
  end Put_Line_Flo;

  procedure Put_Line_Flo(
    Val : in Some_Float) is

  begin
    Ada.Text_IO.Put_Line("Val: " & Some_Float'Image(Val));
  end Put_Line_Flo;

  Int_Test1 : Some_Int     := 10;
  Int_Test2 : Some_Int     := 20;
  Int_Temp : Some_Int      := 0;
  Float_Test1 : Some_Float := -1.0;
  Float_Test2 : Some_Float := -2.0;
  Float_Temp : Some_Float  := 0.0;
begin
  Put_Line_Int(Int_Test1, Int_Test2);
  Generic_Package_Test.Swap(Int_Test1, Int_Test2);
  Put_Line_Int(Int_Test1, Int_Test2);

  Ada.Text_IO.Put("Min value: ");
  Put_Line_Int(Generic_Package_Test.Min(Int_Test1, Int_Test2));

  Ada.Text_IO.Put("Max value: ");
  Put_Line_Int(Generic_Package_Test.Max(Int_Test1, Int_Test2));

  Put_Line_Flo(Float_Test1, Float_Test2);
  Generic_Package_Test.Swap(Float_Test1, Float_Test2);
  Put_Line_Flo(Float_Test1, Float_Test2);

  Ada.Text_IO.Put("Min value: ");
  Put_Line_Flo(Generic_Package_Test.Min(Float_Test1, Float_Test2));

  Ada.Text_IO.Put("Max value: ");
  Put_Line_Flo(Generic_Package_Test.Max(Float_Test1, Float_Test2));
end Generic_Main;

