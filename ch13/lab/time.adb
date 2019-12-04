-- time.adb:

package body Time is
  procedure Put(
    TR : in Time_Rec) is

  begin
    Ada.Text_IO.Put("Hours: " & Natural'Image(TR.Hours) & " Minutes: " & Natural'Image(TR.Minutes));
  end Put;

  procedure Put_Line(
    TR : in Time_Rec) is
  begin
    Put(TR);
    Ada.Text_IO.New_Line;
  end Put_Line;

  function "+"(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Time_Rec is

    Temp : Time_Rec;
    Result : Natural := 0;
  begin
    Result := Get_Minutes(Val1) + Get_Minutes(Val2);
    Temp := Get_Time_Rec(Result);

    return Temp;
  end "+";

  function "+"(
    Val_Minutes : in Natural;
    Val2 : in Time_Rec)
      return Time_Rec is

    Temp : Time_Rec;
    Result : Natural := 0;
  begin
    Result := Val_Minutes + Get_Minutes(Val2);
    Temp := Get_Time_Rec(Result);

    return Temp;
  end "+";

  function "+"(
    Val1 : in Time_Rec;
    Val_Minutes : in Natural)
      return Time_Rec is

  begin
    return Val_Minutes + Val1;
  end "+";

  function "-"(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Time_Rec is

    Temp : Time_Rec := Val1;
    Result : Natural := 0;
  begin
    if Get_Minutes(Val1) > Get_Minutes(Val2) then
      Result := Get_Minutes(Val1) - Get_Minutes(Val2);

      Temp := Get_Time_Rec(Result);
    else
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error,
        "ERROR: The number of minutes is not enough!");
    end if;

    return Temp;
  end "-";

  function "-"(
    Val_Minutes : in Natural;
    Val2 : in Time_Rec)
      return Time_Rec is

    Temp : Time_Rec := Val2;
    Result : Natural := 0;
  begin
    if Val_Minutes > Get_Minutes(Val2) then
      Result := Val_Minutes - Get_Minutes(Val2);

      Temp := Get_Time_Rec(Result);
    else
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error,
        "ERROR: The number of minutes is not enough!");
    end if;

    return Temp;
  end "-";

  function "-"(
    Val1 : in Time_Rec;
    Val_Minutes : in Natural)
      return Time_Rec is

    Temp : Time_Rec := Val1;
    Result : Natural := 0;
  begin
    if Get_Minutes(Val1) > Val_Minutes then
      Result := Get_Minutes(Val1) - Val_Minutes;

      Temp := Get_Time_Rec(Result);
    else
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error,
        "ERROR: The number of minutes is not enough!");
    end if;

    return Temp;
  end "-";

  function "*"(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Time_Rec is

    Result : Natural := 0;
    Temp : Time_Rec;
  begin
    Result := Get_Minutes(Val1) * Get_Minutes(Val2);
    Temp := Get_Time_Rec(Result);

    return Temp;
  end "*";

  function "*"(
    Val1 : in Time_Rec;
    Val_Minutes : in Natural)
      return Time_Rec is

    Result : Natural := 0;
    Temp : Time_Rec;
  begin
    Result := Get_Minutes(Val1) * Val_Minutes;
    Temp := Get_Time_Rec(Result);

    return Temp;
  end "*";

  function "*"(
    Val_Minutes : in Natural;
    Val2 : in Time_Rec)
      return Time_Rec is

  begin
    return Val2 * Val_Minutes;
  end "*";

  function "/"(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Time_Rec is

    Temp : Time_Rec;
    Result : Natural := 0;
  begin
    Result := Get_Minutes(Val1) / Get_Minutes(Val2);
    Temp := Get_Time_Rec(Result);

    return Temp;
  end "/";

  function "/"(
    Val1 : in Time_Rec;
    Val_Minutes : in Natural)
      return Time_Rec is

    Temp : Time_Rec;
    Result : Natural := 0;
  begin
    Result := Get_Minutes(Val1) / Val_Minutes;
    Temp := Get_Time_Rec(Result);

    return Temp;
  end "/";

  function "/"(
    Val_Minutes : in Natural;
    Val2 : in Time_Rec)
      return Time_Rec is

    Temp : Time_Rec;
    Result : Natural := 0;
  begin
    Result := Val_Minutes / Get_Minutes(Val2);
    Temp := Get_Time_Rec(Result);

    return Temp;
  end "/";

  function Get_Time_Rec(
    Val : in Natural)
      return Time_Rec is

    Temp : Time_Rec;
  begin
    Temp.Hours := Val / 60;
    Temp.Minutes := Val rem 60;

    return Temp;
  end Get_Time_Rec;

  function "="(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Boolean is

  begin
    if Get_Minutes(Val1) = Get_Minutes(Val2) then
      return True;
    else
      return False;
    end if;
  end "=";

  function ">"(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Boolean is

  begin
    if Get_Minutes(Val1) > Get_Minutes(Val2) then
      return True;
    else
      return False;
    end if;
  end ">";

  function ">"(
    Val1 : in Time_Rec;
    Val_Minutes : in Natural)
      return Boolean is

  begin
    if Get_Minutes(Val1) > Val_Minutes then
      return True;
    else
      return False;
    end if;
  end ">";

  function ">"(
    Val_Minutes : in Natural;
    Val2 : in Time_Rec)
      return Boolean is

  begin
    if Val_Minutes > Get_Minutes(Val2) then
      return True;
    else
      return False;
    end if;
  end ">";

  function "<"(
    Val1 : in Time_Rec;
    Val2 : in Time_Rec)
      return Boolean is

  begin
    if Get_Minutes(Val1) < Get_Minutes(Val2) then
      return True;
    else
      return False;
    end if;
  end "<";

  function "<"(
    Val1 : in Time_Rec;
    Val_Minutes : in Natural)
      return Boolean is

  begin
    if Get_Minutes(Val1) < Val_Minutes then
      return True;
    else
      return False;
    end if;
  end "<";

  function "<"(
    Val_Minutes : in Natural;
    Val2 : in Time_Rec)
      return Boolean is

  begin
    if Val_Minutes < Get_Minutes(Val2) then
      return True;
    else
      return False;
    end if;
  end "<";

  function Get_Minutes(
    Val : in Time_Rec)
      return Natural is

  begin
    return Val.Hours * 60 + Val.Minutes;
  end Get_Minutes;
end Time;

