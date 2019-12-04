-- automobile.ads:

package Automobile is
  type Auto is private;

  function Init
    return Auto;

  function Init(
    Horsepower : in Positive)
      return Auto;

  function Init(
    Horsepower : in Positive;
    Cylinders : in Positive)
      return Auto;

  function Init(
    Horsepower : in Positive;
    Cylinders : in Positive;
    Transmission : in Boolean)
      return Auto;

  function Init(
    Horsepower : in Positive;
    Cylinders : in Positive;
    Transmission : in Boolean;
    Doors : in Positive)
      return Auto;

  function Set_Horsepower(
    Au : in Auto;
    Horsepower : in Positive)
      return Auto;

  function Set_Cylinders(
    Au : in Auto;
    Cylinders : in Positive)
      return Auto;

  function Set_Transmission(
    Au : in Auto;
    Transmission : in Boolean)
      return Auto;

  function Set_Doors(
    Au : in Auto;
    Doors : in Positive)
      return Auto;

  function Get_Horsepower(
    Au : in Auto)
      return Positive;

  function Get_Cylinders(
    Au : in Auto)
      return Positive;

  function Get_Transmission(
    Au : in Auto)
      return Boolean;

  function Get_Doors(
    Au : in Auto)
      return Positive;

  procedure Print_Auto(
    Au : in Auto);
private
  type Auto is record
    Horsepower   : Positive := 1;
    Cylinders    : Positive := 1;
    -- true for automatic, false for manual.
    Transmission : Boolean  := True;
    Doors        : Positive := 1;
  end record;
end Automobile;
