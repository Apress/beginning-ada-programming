-- multiply_array.ads:

pragma Assertion_Policy(Check);

package Multiply_Array is
  type Int_Array is array(Positive range <>) of Integer;

  procedure Init_Array(Arr : in out Int_Array);

  procedure Multiply_By_Two(Arr : in out Int_Array)
    with Post => (for all Item in Arr'Range =>
                    Arr(Item) = Arr'Old(Item) * 2);

  procedure Print_Array(Arr : in Int_Array)
    with Pre => (for some Index in Arr'Range =>
                   Arr(Index) /= 0);
end Multiply_Array;
