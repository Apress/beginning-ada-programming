-- switch_statement.adb:

with Ada.Text_IO;

procedure switch_statement is
  SomeVal : Integer := 3;

  type Days is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
  Today : Days := Wednesday;
begin
  case SomeVal is
    when 0 =>
      Ada.Text_IO.Put_Line("The value is 0.");
    when 1 =>
      Ada.Text_IO.Put_Line("The value is 1.");
    when 2 .. 4 =>
      Ada.Text_IO.Put_Line("The value is from 2 to 4.");
    when 5 | 6 =>
      Ada.Text_IO.Put_Line("The value is either 5 or 6.");
    when 7 .. 9 | 11 | 13 =>
      Ada.Text_IO.Put_Line("The value is between 7 and 9 or can be 11 or 13.");
    when others =>
      Ada.Text_IO.Put_Line("I don't know what the value is.");
  end case;

  Ada.Text_IO.New_Line(2);

  case Today is
    when Monday =>
      Ada.Text_IO.Put_Line("Today is Monday.");
    when Tuesday =>
      Ada.Text_IO.Put_Line("Today is Tuesday.");
    when Wednesday | Thursday | Friday =>
      Ada.Text_IO.Put_Line("Today is either Wednesday, Thursday or Friday.");
    when Saturday | Sunday =>
      Ada.Text_IO.Put_Line("Today is either Saturday or Sunday.");
    when others =>
      Ada.Text_IO.Put_Line("I don't know what today is.");
  end case;

  Ada.Text_IO.New_Line(2);
end switch_statement;

