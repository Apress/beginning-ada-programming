-- air_vehicle.ads:

package Air_Vehicle is
  type Air_Machine is tagged private;

  procedure Print_Description(
    AM : in Air_Machine);
private
  type Air_Machine is tagged record
    Height : Natural;               -- meters
    Length : Natural;               -- meters
    Width : Natural;                -- meters
    Mass : Natural;                 -- kilograms
    Max_Operating_Height : Natural; -- meters
    Max_Speed : Float;              -- kilometers per hour
  end record;
end Air_Vehicle;
