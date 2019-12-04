-- mouse_trap.adb:

with Ada.Text_IO;

package body Mouse_Trap is
  procedure Catch_Mice is
  begin
    for mouse in 1 .. 351 loop
      if (Opened_Door = True) and (Mouse_On_Platform = False) then
        -- the mouse enters the trap.
        Mouse_On_Platform := True;

        Mousetrap :
        declare
        begin
          Shut_Door;
          Transfer_Mouse;
          Reset_Trap;
        exception
          when Constraint_Error =>
            Ada.Text_IO.Put_Line("ERROR: Constraint error!");
          when others =>
            Ada.Text_IO.Put_Line("ERROR: Unkown error!");
        end Mousetrap;
      end if;
    end loop;

    Print_Results;
  end Catch_Mice;

  procedure Shut_Door is
  begin
    Opened_Door := False;
  end Shut_Door;

  procedure Transfer_Mouse is
  begin
    Mouse_On_Platform := False;
    Total_Mice_Caught := Total_Mice_Caught + 1;
  end Transfer_Mouse;

  procedure Reset_Trap is
  begin
    Opened_Door := True;
  end Reset_Trap;

  procedure Print_Results is
  begin
    Ada.Text_IO.Put_Line("Total mice caught: " &
      Natural'Image(Total_Mice_Caught));
    Ada.Text_IO.Put_Line("  Weight on platform: [" &
      Boolean'Image(Mouse_On_Platform) & "] Opened Door: [" &
      Boolean'Image(Opened_Door) & "]");
  end Print_Results;
end Mouse_Trap;
