-- chatty_tasks.adb:

with Ada.Text_IO;

procedure Chatty_Tasks is
  task type Comm_Task is
    entry Add(Value : in Integer);
    entry Subtract(Value : in Integer);
    entry Retrieve(Value : out Integer);
    entry Start(Receiver : in out Comm_Task);
    entry End_Task;
  end Comm_Task;

  

  task body Comm_Task is
    Internal_Value : Integer := 0;
  begin
    accept Start(Receiver : in out Comm_Task) do
      null;
    end Start;

    Main_Task_Loop :
    loop
      select
        accept Add(Value : in Integer) do
          Internal_Value := Value + 1;
        end Add;
      or
        accept Subtract(Value : in Integer) do
          Internal_Value := Value + 1;
        end Subtract;
      or
        accept Retrieve(Value : out Integer) do
          Value := Internal_Value;
        end Retrieve;
      or
        accept End_Task;
        Ada.Text_IO.Put_Line("Exiting task!");
        exit Main_Task_Loop; 
      else
        null;
      end select;

      delay 0.5;
    end loop Main_Task_Loop;
  end Comm_Task;

  Task_1 : Comm_Task;
  Task_2 : Comm_Task;
begin
  null;
end Chatty_Tasks;
