-- gener.adb:

package body Generic_Queue is
  procedure Print_Queue(
    Qu : in out Queue_Instance) is

  begin
    if Qu.Start_Pointer /= 0
    then
      for iter in 1 .. Qu.Start_Pointer
      loop
        Ada.Text_IO.Put_Line("Instance: " & Integer'Image(iter) &
          "   Value: " & Custom_Type'Image(Qu.Internal_Queue(iter)));
      end loop;
    else
      Ada.Text_IO.Put_Line(" - The queue is empty. -");
    end if;

    Ada.Text_IO.New_Line;
  end Print_Queue;

  function Init_Queue
    return Queue_Instance is

    Qu : Queue_Instance;
  begin
    Qu.Start_Pointer := 0;

    return Qu;
  end Init_Queue;

  procedure Pop(
    Qu : in out Queue_Instance;
    Val : in out Custom_Type) is

  begin
    if (Qu.Start_Pointer > 0) then
      -- grab the first value, this will be returned to the caller of this procedure.
      Val := Qu.Internal_Queue(1);
 
      -- in this case, a loop is needed.  A loop will simply move all of the elements inside of the array up so that it will simulate a queue whose value has
      --  been removed.
      for iter in 1 .. (Qu.Start_Pointer - 1)
      loop
        Qu.Internal_Queue(iter) := Qu.Internal_Queue(iter + 1);
      end loop;

      -- now update the natural type that represents the end of the queue in the array.
      Qu.Start_Pointer := Qu.Start_Pointer - 1;
    else
      Ada.Text_IO.Put_Line("ERROR: The queue is empty!");
    end if;
  end Pop;

  procedure Push(
    Qu : in out Queue_Instance;
    Val : in Custom_Type) is

  begin
    -- in this if-statement, the comparison is less than 40 because if it's 39, then the application can proceed and the internal counter will be incremented.
    --  However, when the counter reaches for, then the entire queue is full and no further insert operations can be run.
    if (Qu.Start_Pointer < 40) then
      Qu.Start_Pointer := Qu.Start_Pointer + 1;
      Qu.Internal_Queue(Qu.Start_Pointer) := Val;
    else
      Ada.Text_IO.Put_Line("ERROR: The queue is full!");
    end if;
  end Push;
end Generic_Queue;

