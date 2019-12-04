-- calculator.ads:

with Ada.Text_IO;

package Calculator is
  -- this is for addition.
  function Addition(
    Input1 : in Integer;
    Input2 : in Integer)
      return Integer;

  -- this is for subtraction.
  function Subtraction(
    Input1 : in Integer;
    Input2 : in Integer)
      return Integer;

  -- this is for multiplication.
  function Multiplication(
    Input1 : in Integer;
    Input2 : in Integer)
      return Integer;

  -- this is for division.
  function Division(
    Input1 : in Integer;
    Input2 : in Integer)
      return Integer;

  -- this is for addition.
  function Addition(
    Input1 : in Float;
    Input2 : in Float)
      return Float;

  -- this is for subtraction.
  function Subtraction(
    Input1 : in Float;
    Input2 : in Float)
      return Float;

  -- this is for multiplication.
  function Multiplication(
    Input1 : in Float;
    Input2 : in Float)
      return Float;

  -- this is for division.
  function Division(
    Input1 : in Float;
    Input2 : in Float)
      return Float;
end Calculator;
