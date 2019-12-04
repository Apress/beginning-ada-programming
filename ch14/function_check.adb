-- function_check.adb:

with Ada.Strings.Fixed;

package body Function_Check is
  function Evaluate(
    Command : in String)
      return Boolean is

  begin
    return Ada.Strings.Fixed.Index(Command, "command:") > 0;
  end Evaluate;

  function Is_Formatted_Correctly(
    Command : in String)
      return Boolean is

  begin
    return Ada.Strings.Fixed.Index(Command, "command:") > 0;
  end Is_Formatted_Correctly;
end Function_Check;
