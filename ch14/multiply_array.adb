-- multiply_array.adb:

with Ada.Text_IO;

package body Multiply_Array is
  procedure Init_Array(
    Arr : in out Int_Array) is

  begin
    for iter in Arr'Range loop
      Arr(iter) := iter + 5;
    end loop;
  end Init_Array;

  procedure Multiply_By_Two(
    Arr : in out Int_Array) is

  begin
    for iter in Arr'Range loop
      Arr(iter) := Arr(iter) * 2;
    end loop;
  end Multiply_By_Two;

  procedure Print_Array(
    Arr : in Int_Array) is

  begin
    Ada.Text_IO.Put_Line("The contents of the current array:");

    for iter in Arr'Range loop
      Ada.Text_IO.Put(" " & Integer'Image(Arr(iter)));
    end loop;

    Ada.Text_IO.New_Line(2);
  end Print_Array;
end Multiply_Array;
