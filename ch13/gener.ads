-- gener.ads:

generic
  type Custom_Integer_Type is (<>);
  type Custom_Float_Type is digits <>;
package Gener is
  procedure Swap(
    Val1 : in out Custom_Integer_Type;
    Val2 : in out Custom_Integer_Type);

  function Min(
    Val1 : in Custom_Integer_Type;
    Val2 : in Custom_Integer_Type)
      return Custom_Integer_Type;

  function Max(
    Val1 : in Custom_Integer_Type;
    Val2 : in Custom_Integer_Type)
      return Custom_Integer_Type;

  procedure Swap(
    Val1 : in out Custom_Float_Type;
    Val2 : in out Custom_Float_Type);

  function Min(
    Val1 : in Custom_Float_Type;
    Val2 : in Custom_Float_Type)
      return Custom_Float_Type;

  function Max(
    Val1 : in Custom_Float_Type;
    Val2 : in Custom_Float_Type)
      return Custom_Float_Type;
end Gener;

