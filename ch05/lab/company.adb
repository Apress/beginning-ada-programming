-- company.adb:
--
-- How to compile this code:
--  $ gnatmake -g company.adb

with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;
with Ada.Strings.Unbounded;
with Ada.Float_Text_IO;
with Ada.Text_IO;

procedure company is
  type Employee is record
    First_Name : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("");
    Last_Name : Ada.Strings.Unbounded.Unbounded_String  := Ada.Strings.Unbounded.To_Unbounded_String("");
    Title : Ada.Strings.Unbounded.Unbounded_String      := Ada.Strings.Unbounded.To_Unbounded_String("");
    Salary : Positive                                   := 1;
    Vacation_Hours : Float                              := 0.0;
    Sick_Time : Float                                   := 0.0;
    Years_Of_Service : Natural                          := 0;
  end record;

  Employees : array(1 .. 10) of Employee;

  -- create a positive value that is within a specific range.
  --  NOTE: Although it is not explicitly mentioned and not checked for, your From needs to be smaller than your To input.  You could, in your example, create
  --   a wrapper function that you call beforehand that will do the checking and then call the below method.
  function Create_Random_Positive(
    Offset : in Natural;
    Range_Val : in Natural)
      return Natural;

  -- create a float value that is within a specific range.
  --  NOTE: Although it is not explicitly mentioned and not checked for, your From needs to be smaller than your To input.  You could, in your example, create
  --   a wrapper function that you call beforehand that will do the checking and then call the below method.
  function Create_Random_Float(
    Offset : in Float;
    Range_Val : in Float)
      return Float;

  -- this procedure will be used to instantiate the array of employees.
  procedure Inst_Employees is
  begin
    -- give the employees some names to start off with.
    Employees(1).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Robert");
    Employees(1).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Kraft");
    Employees(1).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Owner");
    Employees(2).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Bill");
    Employees(2).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Belichick");
    Employees(2).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Head Coach");
    Employees(3).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Tom");
    Employees(3).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Brady");
    Employees(3).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Quarterback");
    Employees(4).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Corey");
    Employees(4).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Dillon");
    Employees(4).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Running Back");
    Employees(5).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Randy");
    Employees(5).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Moss");
    Employees(5).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Wide Receiver");
    Employees(6).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Wes");
    Employees(6).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Welker");
    Employees(6).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Wide Receiver");
    Employees(7).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Troy");
    Employees(7).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Brown");
    Employees(7).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Wide Receiver");
    Employees(8).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Richard");
    Employees(8).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Seymour");
    Employees(8).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Defensive Tackle");
    Employees(9).First_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Ty");
    Employees(9).Last_Name   := Ada.Strings.Unbounded.To_Unbounded_String("Warren");
    Employees(9).Title       := Ada.Strings.Unbounded.To_Unbounded_String("Defensive Tackle");
    Employees(10).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Vince");
    Employees(10).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Willfork");
    Employees(10).Title      := Ada.Strings.Unbounded.To_Unbounded_String("Nose Tackle");

    -- now proceed to generate random values in a loop.
    for index in Employees'Range
    loop
      Employees(index).Salary := Create_Random_Positive(1000000, 5000000);
      Employees(index).Years_Of_Service := Create_Random_Positive(0, 20);
      Employees(index).Sick_Time := Create_Random_Float(0.0, 500.0);
      Employees(index).Vacation_Hours := Create_Random_Float(0.0, 1000.0);
    end loop;
  end Inst_Employees;

  procedure Print_Employees is
  begin
    Ada.Text_IO.Put_Line("The current employees for the New England Patriots.");
    Ada.Text_IO.New_Line;

    for index in Employees'Range
    loop
      Ada.Text_IO.Put_Line(" The first name:    " & Ada.Strings.Unbounded.To_String(Employees(index).First_Name));
      Ada.Text_IO.Put_Line(" The last name:     " & Ada.Strings.Unbounded.To_String(Employees(index).Last_Name));
      Ada.Text_IO.Put_Line(" The title:         " & Ada.Strings.Unbounded.To_String(Employees(index).Title));
      Ada.Text_IO.Put_Line(" Salary:           " & Positive'Image(Employees(index).Salary));
      -- in the following example, in order to suppress the default behavior of printing out the floats in scientific notation, I split up the printing code
      --  and had this done in steps while specifying that the floats should be printed out in a manner that is more widely accepted.
      Ada.Text_IO.Put(" Sick time:         ");
      Ada.Float_Text_IO.Put(Employees(index).Sick_Time, Exp => 0);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put(" Vacation hours:    ");
      Ada.Float_Text_IO.Put(Employees(index).Vacation_Hours, Exp => 0);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line(" Years of service: " & Natural'Image(Employees(index).Years_Of_Service));
      Ada.Text_IO.New_Line;
    end loop;
  end Print_Employees;

  function Create_Random_Positive(
    Offset : in Natural;
    Range_Val : in Natural)
      return Natural is

    subtype Vals is Natural range Offset .. Range_Val;
    package Random_Val is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);

    Gen : Random_Val.Generator;
  begin
    Random_Val.Reset(Gen => Gen);

    return Random_Val.Random(Gen => Gen);
  end Create_Random_Positive;

  function Create_Random_Float(
    Offset : in Float;
    Range_Val : in Float)
      return Float is

    Seed : Ada.Numerics.Float_Random.Generator;
  begin
    Ada.Numerics.Float_Random.Reset(Seed);

    return Offset + (Ada.Numerics.Float_Random.Random(Seed) * Range_Val);
  end Create_Random_Float;
begin
  Inst_Employees;

  Print_Employees;
end company;
