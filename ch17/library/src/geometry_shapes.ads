-- geometry_shapes.ads:

package Geometry_Shapes is
  function Circle_Area(
    Radius : in Float)
      return Float;

  function Circle_Circumference(
    Radius : in Float)
      return Float;

  function Rectangle_Area(
    X : in Float;
    Y : in Float)
      return Float;

  function Square_Area(
    Side : in Float)
      return Float;

  function Sphere_Volume(
    Radius : in Float)
      return Float;
end Geometry_Shapes;
