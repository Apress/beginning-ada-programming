-- protected_record.adb:

with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;

procedure Protected_Record is
  type Racecar_Driver is record
    Age  : Natural := 0;
    Name : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
  end record;

  Joe   : Racecar_Driver;
  Jim   : Racecar_Driver;
  Bob   : Racecar_Driver;
  Larry : Racecar_Driver;
  Mike  : Racecar_Driver;

  procedure Init_Records is
  begin
    Joe.Age := 44;
    Joe.Name := Ada.Strings.Unbounded.To_Unbounded_String("Joe Marrison");
    Jim.Age := 31;
    Jim.Name := Ada.Strings.Unbounded.To_Unbounded_String("Joe Farmer");
    Bob.Age := 34;
    Bob.Name := Ada.Strings.Unbounded.To_Unbounded_String("Bob Zara");
    Larry.Age := 41;
    Larry.Name := Ada.Strings.Unbounded.To_Unbounded_String("Larry Barber");
    Mike.Age := 39;
    Mike.Name := Ada.Strings.Unbounded.To_Unbounded_String("Mike Onion");
  end Init_Records;

  protected type Protected_Record is
    entry Insert(An_Item : in Racecar_Driver);
    entry Unlock_Resource;
  private
    The_Driver : Racecar_Driver;
    Empty : Boolean := True;
  end Protected_Record;

  protected body Protected_Record is
    entry Insert(
      An_Item : in Racecar_Driver)
        when Empty is
    begin
      Empty := False;
      The_Driver := An_Item;

      -- print out the driver.
      Ada.Text_IO.Put_Line("Name: " & Ada.Strings.Unbounded.To_String(The_Driver.Name));
      Ada.Text_IO.Put_Line("Age:  " & Natural'Image(The_Driver.Age));
    end Insert;

    entry Unlock_Resource
      when not Empty is
    begin
      Empty := True;
    end Unlock_Resource;
  end Protected_Record;

  Protected_01 : Protected_Record;

  task type Access_Protected is
    entry Start(Input : in Racecar_Driver);
    entry Quit;
  end Access_Protected;

  task body Access_Protected is
    Go_Loop : Boolean := True;
    Task_Custom_Record : Racecar_Driver;
  begin
    accept Start(Input : in Racecar_Driver) do
      Task_Custom_Record := Input;
    end Start;

    Ada.Text_IO.Put_Line("Task is initialized!");

    while Go_Loop loop
      Ada.Text_IO.Put_Line("Task is in the loop!");
      select
        accept Quit do
          Ada.Text_IO.Put_Line("Task is asked to exit!");

          Go_Loop := False;
        end Quit;
      else
        select
          Protected_01.Insert(Task_Custom_Record);
          delay 0.3;
          Protected_01.Unlock_Resource;
        or delay 1.0;
          Ada.Text_IO.Put_Line(" <=> ERROR!  Failed to acquire resource!");
        end select;
      end select;
    end loop;
    Ada.Text_IO.Put_Line("Task has exited!");
  end Access_Protected;

  Task_01 : Access_Protected;
  Task_02 : Access_Protected;
  Task_03 : Access_Protected;
  Task_04 : Access_Protected;
  Task_05 : Access_Protected;

  Output_String : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
begin
  Ada.Text_IO.Put_Line("Application started");

  Init_Records;

  Task_01.Start(Jim);
  Task_02.Start(Joe);
  Task_03.Start(Bob);
  Task_04.Start(Larry);
  Task_05.Start(Mike);

  delay 9.0;

  Task_01.Quit;
  Task_02.Quit;
  Task_03.Quit;
  Task_05.Quit;
  Task_04.Quit;
end Protected_Record;
