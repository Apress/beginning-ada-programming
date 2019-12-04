-- complex_array.adb:

with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Text_IO;

procedure complex_array is
  ArrayInteger : array (1 .. 6, 1 .. 10) of Integer;
  ArrayFloat : array(-5 .. 20, 1 .. 15) of Float;
begin
  -- make some default initializations.
  ArrayInteger := (others => (others => 0));
  ArrayFloat := (others => (others => 0.0));

  for iterA in ArrayInteger'Range(1) loop
    for iterB in ArrayInteger'Range(2) loop
      Ada.Integer_Text_IO.Put(ArrayInteger(iterA, iterB));
    end loop;

    Ada.Text_IO.New_Line;
  end loop;

  for iterA in ArrayFloat'Range(1) loop
    for iterB in ArrayFloat'Range(2) loop
      Ada.Float_Text_IO.Put(ArrayFloat(iterA, iterB), Exp => 0);
    end loop;

    Ada.Text_IO.New_Line;
  end loop;
end complex_array;
