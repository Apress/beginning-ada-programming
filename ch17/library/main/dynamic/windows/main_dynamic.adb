-- main_dynamic.adb:

with Ada.Text_IO;

with Geometry_Shapes;
with Calc_Time;

procedure Main_Dynamic is
  Radius_Val : constant Float := 4.5;
  X_Side : constant Float     := 8.0;
  Y_Side : constant Float     := 13.5;

  Curr_Time : Calc_Time.Mins := Calc_Time.Init(4, 25);
begin
  Ada.Text_IO.Put_Line("  The current radius that is being used: " & Float'Image(Radius_Val));
  Ada.Text_IO.Put_Line("    The area of a circle:                " & Float'Image(Geometry_Shapes.Circle_Area(Radius_Val)));
  Ada.Text_IO.Put_Line("    The circumference of a circle:       " & Float'Image(Geometry_Shapes.Circle_Circumference(Radius_Val)));
  Ada.Text_IO.Put_Line("    The volume of a sphere:              " & Float'Image(Geometry_Shapes.Sphere_Volume(Radius_Val)));
  Ada.Text_IO.New_Line(2);

  Ada.Text_IO.Put_Line("  The current X side of a rectangle:     " & Float'Image(X_Side));
  Ada.Text_IO.Put_Line("  The current Y side of a rectangle:     " & Float'Image(Y_Side));
  Ada.Text_IO.Put_Line("    The area of a square with X size:    " & Float'Image(Geometry_Shapes.Square_Area(X_Side)));
  Ada.Text_IO.Put_Line("    The area of a square with X size:    " & Float'Image(Geometry_Shapes.Rectangle_Area(X_Side, Y_Side)));
  Ada.Text_IO.New_Line(2);

  -- print the currrent time.
  Ada.Text_IO.Put_Line("  The current time:");
  Calc_Time.Put_Line(Curr_Time);
  Ada.Text_IO.New_Line;

  -- add hours and print it out.
  Ada.Text_IO.Put_Line("  The current time after 12 hours added:");
  Curr_Time := Calc_Time.Add_Hours(Curr_Time, 12);
  Calc_Time.Put_Line(Curr_Time);
  Ada.Text_IO.New_Line;

  -- add minutes and print it out.
  Ada.Text_IO.Put_Line("  The current time after 12 minutes added:");
  Curr_Time := Calc_Time.Add_Minutes(Curr_Time, 12);
  Calc_Time.Put_Line(Curr_Time);
  Ada.Text_IO.New_Line;

  Ada.Text_IO.Put_Line("  The current time after 67 minutes added:");
  Curr_Time := Calc_Time.Add_Minutes(Curr_Time, 67);
  Calc_Time.Put_Line(Curr_Time);
  Ada.Text_IO.New_Line;

  -- subtract hours and print it out.
  Calc_Time.Put_Line(Curr_Time);
  Ada.Text_IO.Put_Line("  The current time after 2 hours subtracted:");
  Curr_Time := Calc_Time.Subtract_Hours(Curr_Time, 2);
  Calc_Time.Put_Line(Curr_Time);
  Ada.Text_IO.New_Line;

  -- subtract minutes and print it out.
  Ada.Text_IO.Put_Line("  The current time after 6 minutes subtracted:");
  Curr_Time := Calc_Time.Subtract_Minutes(Curr_Time, 6);
  Calc_Time.Put_Line(Curr_Time);
  Ada.Text_IO.New_Line;

  Ada.Text_IO.Put_Line("  The current time after 39 minutes subtracted:");
  Curr_Time := Calc_Time.Subtract_Minutes(Curr_Time, 39);
  Calc_Time.Put_Line(Curr_Time);
  Ada.Text_IO.New_Line;
end Main_Dynamic;
