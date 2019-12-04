-- geometry_shapes.adb:

with Ada.Numerics;

package body Geometry_Shapes is
  function Circle_Area(
    Radius : in Float)
      return Float is

  begin
    return Radius * Radius * Ada.Numerics.Pi;
  end Circle_Area;

  function Circle_Circumference(
    Radius : in Float)
      return Float is

  begin
    return Radius * 2.0 * Ada.Numerics.Pi;
  end Circle_Circumference;

  function Rectangle_Area(
    X : in Float;
    Y : in Float)
      return Float is

  begin
    return X * Y;
  end Rectangle_Area;

  function Square_Area(
    Side : in Float)
      return Float is

  begin
    return Rectangle_Area(Side, Side);
  end Square_Area;

  function Sphere_Volume(
    Radius : in Float)
      return Float is

  begin
    return (4.0 / 3.0) * Ada.Numerics.Pi * Radius * Radius * Radius;
  end Sphere_Volume;
end Geometry_Shapes;
