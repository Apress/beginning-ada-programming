-- gener.adb:

package body Gener is
  procedure Swap(
    Val1 : in out Custom_Integer_Type;
    Val2 : in out Custom_Integer_Type) is

    Temp : Custom_Integer_Type;
  begin
    Temp := Val2;
    Val2 := Val1;
    Val1 := Temp;
  end Swap;

  function Min(
    Val1 : in Custom_Integer_Type;
    Val2 : in Custom_Integer_Type)
      return Custom_Integer_Type is
  begin
    if Val1 < Val2 then
      return Val1;
    else
      return Val2;
    end if;
  end Min;

  function Max(
    Val1 : in Custom_Integer_Type;
    Val2 : in Custom_Integer_Type)
      return Custom_Integer_Type is
  begin
    if Val1 > Val2 then
      return Val1;
    else
      return Val2;
    end if;
  end Max;

  procedure Swap(
    Val1 : in out Custom_Float_Type;
    Val2 : in out Custom_Float_Type) is

    Temp : Custom_Float_Type;
  begin
    Temp := Val2;
    Val2 := Val1;
    Val1 := Temp;
  end Swap;

  function Min(
    Val1 : in Custom_Float_Type;
    Val2 : in Custom_Float_Type)
      return Custom_Float_Type is
  begin
    if Val1 < Val2 then
      return Val1;
    else
      return Val2;
    end if;
  end Min;

  function Max(
    Val1 : in Custom_Float_Type;
    Val2 : in Custom_Float_Type)
      return Custom_Float_Type is
  begin
    if Val1 > Val2 then
      return Val1;
    else
      return Val2;
    end if;
  end Max;
end Gener;

