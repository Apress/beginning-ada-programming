-- main.adb:
--  This is how you compile this file along with the Calculator package.
--   $ gnatmake -g main.adb

with Ada.Text_IO;

with Calculator;

procedure Main is
begin
  Ada.Text_IO.Put_Line(" Addition:       " & Integer'Image(Calculator.Addition(44, 29)));
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line(" Subtraction:    " & Integer'Image(Calculator.Subtraction(34, 56)));
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line(" Multiplication: " & Integer'Image(Calculator.Multiplication(13,  71)));
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line(" Division:       " & Integer'Image(Calculator.Division(59, 13)));
  Ada.Text_IO.New_Line;

  Ada.Text_IO.Put_Line(" Addition float:       " & Float'Image(Calculator.Addition(12.0, 3.2)));
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line(" Subtraction float:    " & Float'Image(Calculator.Subtraction(65.9, 63.1)));
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line(" Multiplication float: " & Float'Image(Calculator.Multiplication(2.3,  7.88)));
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line(" Division float:       " & Float'Image(Calculator.Division(130.9, 13.4)));
  Ada.Text_IO.New_Line;
end Main;
