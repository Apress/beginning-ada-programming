-- iterate_10000.adb:

with Ada.Text_IO;

procedure iterate_10000 is
  Remainder : Natural := 1;
begin
  for iter in 1 .. 10000 loop
    if (iter rem 23) = 0
    then
      Ada.Text_IO.Put_Line(" This value is divisible by 23: " & Natural'Image(iter));
    end if;

    if (iter rem 13) = 0
    then
      Ada.Text_IO.Put_Line(" This value is divisible by 13: " & Natural'Image(iter));
    end if;

    if (iter rem 3) = 0
    then
      Ada.Text_IO.Put_Line(" This value is divisible by 3: " & Natural'Image(iter));
    end if;
  end loop;
end iterate_10000;

