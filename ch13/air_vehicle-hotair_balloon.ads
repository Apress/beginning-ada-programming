-- hotair_balloon.ads:

with Ada.Float_Text_IO;
with Ada.Text_IO;

package Air_Vehicle.Hotair_Balloon is
  type HA_Balloon is new Air_Machine with private;

  function Init_Balloon(
    B_Height : in Natural;
    B_Length : in Natural;
    B_Width : in Natural;
    B_Mass : in Natural;
    B_Max_Operating_Height : in Natural;
    B_Max_Speed : in Float;
    B_Balloon_Volume_M3 : in Positive;
    B_Propane_Volume : in Float)
      return HA_Balloon;

  procedure Print_Description(
    HAB : in HA_Balloon);
private
  type HA_Balloon is new Air_Machine with record
    Balloon_Volume_M3 : Positive; -- cubic meters
    Propane_Volume : Float;       -- liters
  end record;
end Air_Vehicle.Hotair_Balloon;
