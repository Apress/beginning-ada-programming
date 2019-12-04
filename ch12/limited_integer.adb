-- limited_integer.adb:

with Ada.Text_IO;

procedure Limited_Integer is
  subtype Menu_Selection_Value is Integer range 1 .. 6;
  package Menu_Input is new Ada.Text_IO.Integer_IO(Num => Menu_Selection_Value);
  Selected : Menu_Selection_Value := 1;
begin
  Main_Menu :
  loop
    Ada.Text_IO.Put_Line(" - Main Menu at Healthy Fast Food(tm) -");
    Ada.Text_IO.Put_Line(" - 1 - Order Apples");
    Ada.Text_IO.Put_Line(" - 2 - Order Pears");
    Ada.Text_IO.Put_Line(" - 3 - Order Asparagus");
    Ada.Text_IO.Put_Line(" - 4 - Order Cauliflower");
    Ada.Text_IO.Put_Line(" - 5 - Order Granola Bar");
    Ada.Text_IO.Put_Line(" - 6 - Quit");
    Ada.Text_IO.Put(" Your selection: ");

    Main_Menu_Input :
    declare
    begin
      Menu_Input.Get(Selected);
    exception
      when others =>
        Ada.Text_IO.New_Line;
        Ada.Text_IO.Put_Line("ERROR: Input incorrect, must be from 1 to 6.");
        Ada.Text_IO.New_Line(2);
    end Main_Menu_Input;

    case Selected is
      when 1 =>
        Ada.Text_IO.Put_Line("Your apples is ready!");
        Ada.Text_IO.New_Line;
      when 2 =>
        Ada.Text_IO.Put_Line("Your pears is ready!");
        Ada.Text_IO.New_Line;
      when 3 =>
        Ada.Text_IO.Put_Line("Your asparagus is ready!");
        Ada.Text_IO.New_Line;
      when 4 =>
        Ada.Text_IO.Put_Line("Your cauliflower is ready!");
        Ada.Text_IO.New_Line;
      when 5 =>
        Ada.Text_IO.Put_Line("Your granola bar is ready!");
        Ada.Text_IO.New_Line;
      when 6 =>
        exit Main_Menu;
      when others =>
        Ada.Text_IO.Put_Line("ERROR: Unknown type!");
        Ada.Text_IO.New_Line;
    end case;
  end loop Main_Menu;
end Limited_Integer;
