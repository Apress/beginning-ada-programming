-- contracts.ads:

pragma Assertion_Policy(Check);

package Contracts is
  procedure Simulate;
private
  Bottles_Finished : Natural        := 0;
  Boxes_Packed : Natural            := 0;
  Bottles_In_Box : constant Natural := 16;

  procedure Label_Bottle;

  procedure Package_Bottles
    with Pre  => (Bottles_Finished >= Bottles_In_Box),
         Post => (Bottles_In_Box - Bottles_Finished = Bottles_Finished'Old);

  procedure Print_Report;
end Contracts;
