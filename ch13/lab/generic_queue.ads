-- gener.ads:

with Ada.Text_IO;

generic
  type Custom_Type is (<>);
package Generic_Queue is
  type Queue_Instance is private;-- record;

  function Init_Queue
    return Queue_Instance;

  procedure Print_Queue(
    Qu : in out Queue_Instance);

  procedure Pop(
    Qu : in out Queue_Instance;
    Val : in out Custom_Type);

  procedure Push(
    Qu : in out Queue_Instance;
    Val : in Custom_Type);
private
  Queue_Length : constant Positive := 40;
  type Custom_Type_Queue is array(1 .. Queue_Length) of Custom_Type;

  type Queue_Instance is record
    -- this is not a pointer (or an access type) in a traditional sense.  This number acts as a way to simply represent the starting end of a queue, the end
    --  where values will be inserted.
    Start_Pointer : Natural := 0;
    Internal_Queue : Custom_Type_Queue;
  end record;
end Generic_Queue;

