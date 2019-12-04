-- air_vehicle.adb:

with Ada.Text_IO;

package body Air_Vehicle is
  procedure Print_Description(
    AM : in Air_Machine) is
  begin
    Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error, "ERROR: You should not be seeing this output!");
  end Print_Description;
end Air_Vehicle;
