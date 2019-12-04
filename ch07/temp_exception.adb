-- temp_exception.adv:

with Ada.Text_IO;

procedure Temp_Exception is
  function Convert_F_To_C(
    Fahren : in Float)
      return Float is

  begin
    if Fahren < -459.67 then
      raise Constraint_Error;
    else
      return (Fahren - 32.0) * (5.0 / 9.0);
    end if;
  end Convert_F_To_C;
begin
  Ada.Text_IO.Put_Line(" - Convert 100 Fahrenheit to Celsius: " & Float'Image(Convert_F_To_C(100.0)));
  Ada.Text_IO.Put_Line(" - Convert 100 Fahrenheit to Celsius: " & Float'Image(Convert_F_To_C(0.0)));
  Ada.Text_IO.Put_Line(" - Convert 100 Fahrenheit to Celsius: " & Float'Image(Convert_F_To_C(-100.0)));
  Ada.Text_IO.Put_Line(" - Convert 100 Fahrenheit to Celsius: " & Float'Image(Convert_F_To_C(-459.68)));
exception
  when Constraint_Error =>
    Ada.Text_IO.Put_Line("ERROR: Minimum value exceeded.");
  when Others =>
    Ada.Text_IO.Put_Line("ERROR: I don't know what this error is though...");
end Temp_Exception;
