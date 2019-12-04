-- main.adb:

with Air_Vehicle.Hotair_Balloon;

procedure Main is
  Large_Hotair_Balloon : Air_Vehicle.Hotair_Balloon.HA_Balloon;
begin
  Large_Hotair_Balloon := Air_Vehicle.Hotair_Balloon.Init_Balloon(50, 20, 20, 2000, 10000, 5.5, 300, 1.2);
  Air_Vehicle.Hotair_Balloon.Print_Description(Large_Hotair_Balloon);
end Main;
