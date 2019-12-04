-- calculator.adb:

package body Calculator is
  function Addition(
    Input1 : in Integer;
    Input2 : in Integer)
      return Integer is
  begin
    return Input1 + Input2;
  end Addition;

  function Subtraction(
    Input1 : in Integer;
    Input2 : in Integer)
      return Integer is
  begin
    return Input1 - Input2;
  end Subtraction;

  function Multiplication(
    Input1 : in Integer;
    Input2 : in Integer)
      return Integer is
  begin
    return Input1 * Input2;
  end Multiplication;

  function Division(
    Input1 : in Integer;
    Input2 : in Integer)
      return Integer is
  begin
    return Input1 / Input2;
  end Division;

  function Addition(
    Input1 : in Float;
    Input2 : in Float)
      return Float is
  begin
    return Input1 + Input2;
  end Addition;

  function Subtraction(
    Input1 : in Float;
    Input2 : in Float)
      return Float is
  begin
    return Input1 - Input2;
  end Subtraction;

  function Multiplication(
    Input1 : in Float;
    Input2 : in Float)
      return Float is
  begin
    return Input1 * Input2;
  end Multiplication;

  function Division(
    Input1 : in Float;
    Input2 : in Float)
      return Float is
  begin
    return Input1 / Input2;
  end Division;
end Calculator;
