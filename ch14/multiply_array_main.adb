-- multiply_array_main.adb:

with Multiply_Array;

procedure Multiply_Array_Main is
  use type Multiply_Array.Int_Array;
  MA_Array : Multiply_Array.Int_Array(1 .. 40) := (others => 0);
begin
  Multiply_Array.Init_Array(MA_Array);

  Multiply_Array.Multiply_By_Two(MA_Array);

  Multiply_Array.Print_Array(MA_Array);
end Multiply_Array_Main;
