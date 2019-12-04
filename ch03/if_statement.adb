-- if_statement.adb:

with Ada.Text_IO;

procedure if_statement is
  Int1 : Integer := 45;
  Int2 : Integer := -23;
  Int3 : Integer := 45;
begin
  if Int1 = Int2 or Int1 > Int2
  then
    Ada.Text_IO.Put_Line("Int1 and Int2 are the same.");
  elsif Int1 = Int3 and Int2 <= Int1
  then
    Ada.Text_IO.Put_Line("Int1 and Int3 are the same.");
  else
    Ada.Text_IO.Put_Line("In the else part of if-statement.");
  end if;

  if Int3 in 4 .. 200
  then
    Ada.Text_IO.Put_Line("Int3 is between 4 and 200.");
  else
    Ada.Text_IO.Put_Line("Int3 is not between 4 and 200.");
  end if;

  if Int3 in 90 .. 100
  then
    Ada.Text_IO.Put_Line("Int3 is between 90 and 100.");
  else
    Ada.Text_IO.Put_Line("Int3 is not between 90 and 100.");
  end if;
end if_statement;
