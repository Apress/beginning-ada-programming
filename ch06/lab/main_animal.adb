-- main_animal.adb:

with Ada.Text_IO;

with Animal;

procedure main_animal is
  --use type Animal.Creature;
  Var1 : Animal.Creature := Animal.Init;
  Var2 : Animal.Creature := Animal.Init("Elephant", 4, 4000000, 500);
begin
  -- create some default values to play with.
  Animal.Print_Record(Var1);
  Animal.Print_Record(Var2);

  -- first modify the dog.
  Animal.Set_Name(Var1, "Tarantual");
  Animal.Set_Legs(Var1, 8);
  Animal.Set_Weight_In_Grams(Var1, 200);
  Animal.Set_Height_In_Cm(Var1, 3);

  -- now, modify the elephant.
  Animal.Set_Weight_In_Grams(Var2, 4500000);
  Animal.Set_Height_In_Cm(Var2, 520);

  -- print out the same values with the changes that were made.
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line("After modifications...");
  Animal.Print_Record(Var1);
  Animal.Print_Record(Var2);
end main_animal;

