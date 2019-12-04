-- company.adb:

with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;
with Ada.Strings.Unbounded;
with Ada.Float_Text_IO;
with Ada.Text_IO;

procedure company is
  type Sal_Integer_USD is range 10000000 .. 50000000;
  type Years_Srv is range 0 .. 55;
  type Vac_Float_Hrs is delta 0.1 range 0.0 .. 400.0;
  type Sck_Float_Hrs is delta 0.1 range 0.0 .. 1000.0;

  type Employee is record
    First_Name : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("");
    Last_Name : Ada.Strings.Unbounded.Unbounded_String  := Ada.Strings.Unbounded.To_Unbounded_String("");
    Title : Ada.Strings.Unbounded.Unbounded_String      := Ada.Strings.Unbounded.To_Unbounded_String("");
    Salary : Sal_Integer_USD                            := 10000000;
    Years_Of_Service : Years_Srv                        := 0;
    Vacation_Hours : Vac_Float_Hrs                      := 0.0;
    Sick_Time : Sck_Float_Hrs                           := 0.0;
  end record;

  Employees : array(1 .. 10) of Employee;

  function Create_Salary
    return Sal_Integer_USD;

  function Create_Years_Srv
    return Years_Srv;

  function Create_Vac_Float_Hrs
    return Vac_Float_Hrs;

  function Create_Sck_Float_Hrs
    return Sck_Float_Hrs;

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
      Employees(index).Salary           := Create_Salary;
      Employees(index).Years_Of_Service := Create_Years_Srv;
      Employees(index).Sick_Time        := Create_Sck_Float_Hrs;
      Employees(index).Vacation_Hours   := Create_Vac_Float_Hrs;
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
      Ada.Text_IO.Put_Line(" Salary:           " & Sal_Integer_USD'Image(Employees(index).Salary));
      -- in the following example, in order to suppress the default behavior of printing out the floats in scientific notation, I split up the printing code
      --  and had this done in steps while specifying that the floats should be printed out in a manner that is more widely accepted.
      Ada.Text_IO.Put(" Sick time:         ");
      Ada.Text_IO.Put(Sck_Float_Hrs'Image(Employees(index).Sick_Time));
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put(" Vacation hours:    ");
      Ada.Text_IO.Put(Vac_Float_Hrs'Image(Employees(index).Vacation_Hours));
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line(" Years of service: " & Years_Srv'Image(Employees(index).Years_Of_Service));
      Ada.Text_IO.New_Line;
    end loop;
  end Print_Employees;

  function Create_Random_Positive(
    From : in Natural;
    To : in Natural)
      return Natural is

    subtype Vals is Natural range From .. To;
    package Random_Val is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);

    Gen : Random_Val.Generator;
  begin
    Random_Val.Reset(Gen => Gen);

    return Random_Val.Random(Gen => Gen);
  end Create_Random_Positive;

  function Create_Random_Float(
    From : in Float;
    To : in Float)
      return Float is

    Seed : Ada.Numerics.Float_Random.Generator;
  begin
    Ada.Numerics.Float_Random.Reset(Seed);

    return From + (Ada.Numerics.Float_Random.Random(Seed) * To);
  end Create_Random_Float;

  function Create_Salary
    return Sal_Integer_USD is

    package Random_Val is new Ada.Numerics.Discrete_Random(Result_Subtype => Sal_Integer_USD);

    Gen : Random_Val.Generator;
  begin
    Random_Val.Reset(Gen => Gen);

    return Random_Val.Random(Gen => Gen);
  end Create_Salary;

  function Create_Years_Srv
    return Years_Srv is

    package Random_Val is new Ada.Numerics.Discrete_Random(Result_Subtype => Years_Srv);

    Gen : Random_Val.Generator;
  begin
    Random_Val.Reset(Gen => Gen);

    return Random_Val.Random(Gen => Gen);
  end Create_Years_Srv;

  function Create_Vac_Float_Hrs
    return Vac_Float_Hrs is

    Seed : Ada.Numerics.Float_Random.Generator;

    Temp      : Float := 0.0;
    End_Range : Float := 0.0;
  begin
    Ada.Numerics.Float_Random.Reset(Seed);

    Temp := Float(Vac_Float_Hrs'First) + (Ada.Numerics.Float_Random.Random(Seed) * Temp);
    return Vac_Float_Hrs(Temp);
  end Create_Vac_Float_Hrs;

  function Create_Sck_Float_Hrs
    return Sck_Float_Hrs is

    Seed : Ada.Numerics.Float_Random.Generator;
    Temp : Float := 0.0;
  begin
    Ada.Numerics.Float_Random.Reset(Seed);

    Temp := Float(Sck_Float_Hrs'First) + (Ada.Numerics.Float_Random.Random(Seed) * Temp);
    return Sck_Float_Hrs(Temp);
  end Create_Sck_Float_Hrs;

begin
  Inst_Employees;

  Print_Employees;
end company;

