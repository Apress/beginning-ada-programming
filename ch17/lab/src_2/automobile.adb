-- automobile.adb:

with Ada.Text_IO;

package body Automobile is
  function Init
    return Auto is

    Vehicle : Auto;
  begin
    Vehicle.Horsepower := 120;
    Vehicle.Cylinders := 4;
    Vehicle.Transmission := True;
    Vehicle.Doors := 4;

    return Vehicle;
  end Init;

  function Init(
    Horsepower : in Positive)
      return Auto is

    Vehicle : Auto;
  begin
    Vehicle.Horsepower := Horsepower;
    Vehicle.Cylinders := 4;
    Vehicle.Transmission := True;
    Vehicle.Doors := 4;

    return Vehicle;
  end Init;

  function Init(
    Horsepower : in Positive;
    Cylinders : in Positive)
      return Auto is

    Vehicle : Auto;
  begin
    Vehicle.Horsepower := Horsepower;
    Vehicle.Cylinders := Cylinders;
    Vehicle.Transmission := True;
    Vehicle.Doors := 4;

    return Vehicle;
  end Init;

  function Init(
    Horsepower : in Positive;
    Cylinders : in Positive;
    Transmission : in Boolean)
      return Auto is

    Vehicle : Auto;
  begin
    Vehicle.Horsepower := Horsepower;
    Vehicle.Cylinders := Cylinders;
    Vehicle.Transmission := Transmission;
    Vehicle.Doors := 4;

    return Vehicle;
  end Init;

  function Init(
    Horsepower : in Positive;
    Cylinders : in Positive;
    Transmission : in Boolean;
    Doors : in Positive)
      return Auto is

    Vehicle : Auto;
  begin
    Vehicle.Horsepower := Horsepower;
    Vehicle.Cylinders := Cylinders;
    Vehicle.Transmission := Transmission;
    Vehicle.Doors := Doors;

    return Vehicle;
  end Init;

  function Set_Horsepower(
    Au : in Auto;
    Horsepower : in Positive)
      return Auto is

    Temp : Auto := Au;
  begin
    Temp.Horsepower := Horsepower;

    return Temp;
  end Set_Horsepower;

  function Set_Cylinders(
    Au : in Auto;
    Cylinders : in Positive)
      return Auto is

    Temp : Auto := Au;
  begin
    Temp.Cylinders := Cylinders;

    return Temp;
  end Set_Cylinders;

  function Set_Transmission(
    Au : in Auto;
    Transmission : in Boolean)
      return Auto is

    Temp : Auto := Au;
  begin
    Temp.Transmission := Transmission;

    return Temp;
  end Set_Transmission;

  function Set_Doors(
    Au : in Auto;
    Doors : in Positive)
      return Auto is

    Temp : Auto := Au;
  begin
    Temp.Doors := Doors;

    return Temp;
  end Set_Doors;

  function Get_Horsepower(
    Au : in Auto)
      return Positive is

  begin
    return Au.Horsepower;
  end Get_Horsepower;

  function Get_Cylinders(
    Au : in Auto)
      return Positive is

  begin
    return Au.Cylinders;
  end Get_Cylinders;

  function Get_Transmission(
    Au : in Auto)
      return Boolean is

  begin
    return Au.Transmission;
  end Get_Transmission;

  function Get_Doors(
    Au : in Auto)
      return Positive is

  begin
    return Au.Doors;
  end Get_Doors;

  procedure Print_Auto(
    Au : in Auto) is

  begin
    Ada.Text_IO.Put_Line("  The current car:");
    Ada.Text_IO.Put_Line("   - Horsepower:   " & Positive'Image(Au.Horsepower));
    Ada.Text_IO.Put_Line("   - Cylinders:    " & Positive'Image(Au.Cylinders));

    if Au.Transmission
    then
      Ada.Text_IO.Put_Line("   - Transmission: Automatic");
    else
      Ada.Text_IO.Put_Line("   - Transmission: Manual");
    end if;

    Ada.Text_IO.Put_Line("   - Door:         " & Positive'Image(Au.Doors));
  end Print_Auto;
end Automobile;
