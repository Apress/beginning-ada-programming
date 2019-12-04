-- hotair_balloon.adb:

package body Air_Vehicle.Hotair_Balloon is
  function Init_Balloon(
    B_Height : in Natural;
    B_Length : in Natural;
    B_Width : in Natural;
    B_Mass : in Natural;
    B_Max_Operating_Height : in Natural;
    B_Max_Speed : in Float;
    B_Balloon_Volume_M3 : in Positive;
    B_Propane_Volume : in Float)
      return HA_Balloon is

    HAB : HA_Balloon;
  begin
    HAB.Height := B_Height;
    HAB.Length := B_Length;
    HAB.Width := B_Width;
    HAB.Mass := B_Mass;
    HAB.Max_Operating_Height := B_Max_Operating_Height;
    HAB.Max_Speed := B_Max_Speed;
    HAB.Balloon_Volume_M3 := B_Balloon_Volume_M3;
    HAB.Propane_Volume := B_Propane_Volume;

    return HAB;
  end Init_Balloon;

  procedure Print_Description(
    HAB : in HA_Balloon) is
  begin
    Ada.Text_IO.Put_Line("Height of vehicle:               " & Natural'Image(HAB.Height));
    Ada.Text_IO.Put_Line("Length of vehicle:               " & Natural'Image(HAB.Length));
    Ada.Text_IO.Put_Line("Width of vehicle:                " & Natural'Image(HAB.Width));
    Ada.Text_IO.Put_Line("Mass of vehicle:                 " & Natural'Image(HAB.Mass));
    Ada.Text_IO.Put_Line("Max operating height of vehicle: " & Natural'Image(HAB.Max_Operating_Height));
    Ada.Text_IO.Put("Max speed of vehicle:            ");
    Ada.Float_Text_IO.Put(HAB.Max_Speed, Aft => 2, Exp => 0);
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put_Line("Balloon volume of vehicle:       " & Positive'Image(HAB.Balloon_Volume_M3));
    Ada.Text_IO.Put("Propane volume of vehicle:       ");
    Ada.Float_Text_IO.Put(HAB.Propane_Volume, Aft => 2, Exp => 0);
    Ada.Text_IO.New_Line;
  end Print_Description;
end Air_Vehicle.Hotair_Balloon;
