-- except_main.adb:

with Ada.Text_IO;

with Except_Animal;

procedure Except_Main is
  Var1 : Except_Animal.Creature := Except_Animal.Init;
  Var2 : Except_Animal.Creature := Except_Animal.Init("Elephant", 4, 4000000, 500);

  L_Exception : Except_Animal.Creature;
  H_Exception : Except_Animal.Creature;
begin
  Except_Animal.Print_Record(Var1);
  Except_Animal.Print_Record(Var2);

  -- will print out the legs exception.
  L_Exception := Except_Animal.Init("Stuff1", 1500, 4000, 400);
  -- will print out the height exception.
  H_Exception := Except_Animal.Init("Stuff2", 500, 4000, 2500);

  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line("Print out the variable L_Exception:");
  Except_Animal.Print_Record(L_Exception);
  Ada.Text_IO.New_Line;

  Ada.Text_IO.Put_Line("Print out the variable H_Exception:");
  Except_Animal.Print_Record(H_Exception);
  Ada.Text_IO.New_Line;
end Except_Main;
