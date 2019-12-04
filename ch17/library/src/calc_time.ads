-- time.ads:

package Calc_Time is
  type Mins is private;

  function Init
    return Mins;

  function Init(
    Minutes : in Natural)
      return Mins;

  function Init(
    Hours : in Natural;
    Minutes : in Natural)
      return Mins;

  function Add_Hours(
    Val : in Mins;
    Hours : in Natural)
      return Mins;

  function Add_Minutes(
    Val : in Mins;
    Minutes : in Natural)
      return Mins;

  function Subtract_Hours(
    Val : in Mins;
    Hours : in Natural)
      return Mins;

  function Subtract_Minutes(
    Val : in Mins;
    Minutes : in Natural)
      return Mins;

  procedure Put(
    Val : in Mins);

  procedure Put_Line(
    Val : in Mins);
private
  type Mins is record
    Hours : Natural   := 0;
    Minutes : Natural := 0;
  end record;

  function Get_Minutes(
    Val : in Mins)
      return Natural;
end Calc_Time;
