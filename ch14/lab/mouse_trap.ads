-- mouse_trap.ads:

pragma Assertion_Policy(Check);

package Mouse_Trap is
  procedure Catch_Mice;

private
  Total_Mice_Caught : Natural := 0;
  Mouse_On_Platform : Boolean := False;
  Opened_Door : Boolean       := True;

  procedure Shut_Door
    with Pre  => ((Mouse_On_Platform = True) and (Opened_Door = True)),
         Post => ((Mouse_On_Platform = True) and (Opened_Door = False));

  procedure Transfer_Mouse
    with Pre  => ((Mouse_On_Platform = True) and (Opened_Door = False)),
         Post => ((Mouse_On_Platform = False) and (Total_Mice_Caught - 1 = Total_Mice_Caught'Old));

  procedure Reset_Trap
    with Pre  => ((Mouse_On_Platform = False) and (Opened_Door = False)),
         Post => ((Mouse_On_Platform = False) and (Opened_Door = True));

  procedure Print_Results;
end Mouse_Trap;
