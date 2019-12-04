-- function_check.ads:

pragma Assertion_Policy(Check);

package Function_Check is
  function Is_Formatted_Correctly(
    Command : in String)
      return Boolean;

  function Evaluate(Command : in String) return Boolean
    with Pre => Is_Formatted_Correctly(Command);
end Function_Check;
