-- infinite_loop.adb:

with Ada.Text_IO;

procedure infinite_loop is
begin
  loop
    Ada.Text_IO.Put_Line("Inside of the infinite loop!");
    delay 0.5;
  end loop;
end infinite_loop;

