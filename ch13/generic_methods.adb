-- generic_methods.adb:

with Ada.Text_IO;

procedure Generic_Methods is
  generic
    type T is range <>;
  procedure Print_Int(
    Val : in T);

  generic
    type T is range <>;
  function Compute_Sum(
    Val1 : in T;
    Val2 : in T)
      return T;

  procedure Print_Int(
    Val : in T) is
  begin
    Ada.Text_IO.Put_Line(T'Image(Val));
  end Print_Int;

  function Compute_Sum(
    Val1 : in T;
    Val2 : in T)
      return T is

  begin
    return Val1 + Val2;
  end Compute_Sum;

  procedure Print_Integer is new Print_Int(Integer);
  procedure Print_Positive is new Print_Int(Positive);

  function Sum_Integer is new Compute_Sum(Integer);
  function Sum_Positive is new Compute_Sum(Positive);

  Result_I : Integer := 0;
  Result_P : Positive := 1;
begin
  Ada.Text_IO.Put_Line("Adding some integer values together.");
  Result_I := Sum_Integer(22, -9);
  Print_Integer(Result_I);

  Ada.Text_IO.Put_Line("Adding some positive values together.");
  Result_P := Sum_Positive(49, 73);
  Print_Positive(Result_P);
end Generic_Methods;
