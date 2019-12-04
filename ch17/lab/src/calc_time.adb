-- time.adb:

with Ada.Text_IO;

package body Calc_Time is
  function Init
    return Mins is

    Min : Mins;
  begin
    return Min;
  end Init;

  function Init(
    Minutes : in Natural)
      return Mins is

    Min : Mins;
  begin
    if (Minutes > 59)
    then
      Min.Minutes := Minutes;
    else
      Min.Hours := Minutes / 60;
      Min.Minutes := Minutes;
    end if;

    return Min;
  end Init;

  function Init(
    Hours : in Natural;
    Minutes : in Natural)
      return Mins is

    Min : Mins;
  begin
    Min.Hours := Hours;
    Min.Minutes := Minutes;

    return Min;
  end Init;

  function Add_Hours(
    Val : in Mins;
    Hours : in Natural)
      return Mins is

    Temp_Val : Mins;
  begin
    Temp_Val.Hours := Val.Hours + Hours;
    Temp_Val.Minutes := Val.Minutes;

    return Temp_Val;
  end Add_Hours;

  function Add_Minutes(
    Val : in Mins;
    Minutes : in Natural)
      return Mins is

    Temp_Hours : Natural := 0;
    Temp_Mins : Mins;
  begin
    if (Minutes + Val.Minutes) > 59
    then
      Temp_Hours := (Val.Minutes + Minutes) / 60;
      Temp_Mins.Minutes := (Val.Minutes + Minutes) rem 60;
      Temp_Mins.Hours := Val.Hours + Temp_Hours;

      return Temp_Mins;
    else
      Temp_Mins.Hours := Val.Hours;
      Temp_Mins.Minutes := Temp_Mins.Minutes + Minutes;

      return Temp_Mins;
    end if;
  end Add_Minutes;

  function Subtract_Hours(
    Val : in Mins;
    Hours : in Natural)
      return Mins is

    Temp_Mins : Mins := Val;
  begin
    if Hours > Val.Hours
    then
      return Val;
    else
      Temp_Mins.Hours := Temp_Mins.Hours - Hours;

      return Temp_Mins;
    end if;
  end Subtract_Hours;

  function Subtract_Minutes(
    Val : in Mins;
    Minutes : in Natural)
      return Mins is

    Total_Minutes : Natural := Get_Minutes(Val);
    Temp_Mins : Mins;
  begin
    if Minutes > Total_Minutes
    then
      return Val;
    else
      Total_Minutes := Total_Minutes - Minutes;

      Temp_Mins.Hours := Total_Minutes / 60;
      Temp_Mins.Minutes := Total_Minutes rem 60;

      return Temp_Mins;
    end if;
  end Subtract_Minutes;

  procedure Put(
    Val : in Mins) is

  begin
    Ada.Text_IO.Put("Hours: " & Natural'Image(Val.Hours) & " Minutes: " &
      Natural'Image(Val.Minutes));
  end Put;

  procedure Put_Line(
    Val : in Mins) is

  begin
    Put(Val);
    Ada.Text_IO.New_Line;
  end Put_Line;

  function Get_Minutes(
    Val : in Mins)
      return Natural is

  begin
    return Val.Hours * 60 + Val.Minutes;
  end Get_Minutes;
end Calc_Time;
