-- time.ads:

with Ada.Text_IO;

package Time is
  type Time_Rec is private;

  procedure Put(
    TR : in Time_Rec);

  procedure Put_Line(
    TR : in Time_Rec);

  function "+"(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Time_Rec;

  function "+"(
    Val_Minutes : in Natural;
    Val2 : in Time_Rec)
      return Time_Rec;

  function "+"(
    Val1 : in Time_Rec;
    Val_Minutes : in Natural)
      return Time_Rec;

  function "-"(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Time_Rec;

  function "-"(
    Val_Minutes : in Natural;
    Val2 : in Time_Rec)
      return Time_Rec;

  function "-"(
    Val1 : in Time_Rec;
    Val_Minutes : in Natural)
      return Time_Rec;

  function "="(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Boolean;
private
  type Time_Rec is record
    Hours : Natural   := 0;
    Minutes : Natural := 0;
  end record;

  function Get_Minutes(
    Val : in Time_Rec)
      return Natural;
end Time;

