-- simple_array.adb:

with Ada.Float_Text_IO;
with Ada.Text_IO;

procedure simple_array is
  ArrayFloat : array (1 .. 20) of Float;
  ArrayInteger : array (-5 .. 35) of Integer;
begin
  -- make default assignments to the entire array.
  ArrayFloat := (others => 0.0);
  -- make default assignments to the entire array, but give certain instances a specific value.
  ArrayInteger := (-5 => 1, -4 => 2, -3 => 3, -2 => 4, -1 => 5, 0 => 6, others => 0);

  -- another way to do assignment, in a for-loop.
  for iter in ArrayFloat'Range loop
    ArrayFloat(iter) := 5.13;
  end loop;

  -- this is for printing values to the console.
  for iter in ArrayInteger'Range loop
    Ada.Text_IO.Put(" " & Integer'Image(ArrayInteger(iter)) & " ");
  end loop;

  Ada.Text_IO.New_Line(3);

  for iter in ArrayFloat'Range loop
    Ada.Text_IO.Put(" ");
    Ada.Float_Text_IO.Put(ArrayFloat(iter), Aft => 2, Exp => 0);
    Ada.Text_IO.Put(" ");
  end loop;

  Ada.Text_IO.New_Line;
end simple_array;

