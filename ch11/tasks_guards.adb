-- tasks_guards.adb:

with Ada.Text_IO;

procedure Tasks_Guards is
  task type Comm_Task is
    entry Input(Value : in Integer);
    entry Retrieve(Value : out Integer);
    entry End_Task;
  end Comm_Task;

  task body Comm_Task is
    Internal_Value : Integer := 0;
  begin
    Main_Task_Loop :
    loop
      select
        accept Input(Value : in Integer) do
          Internal_Value := Value * 2;
        end Input;
      or
        when Internal_Value > 10 =>
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
    end loop Main_Task_Loop;
  end Comm_Task;

  Task_1 : Comm_Task;
  Test_Value : Integer := 2;
begin
  Task_1.Input(Test_Value);

  select
    Task_1.Retrieve(Test_Value);

    Ada.Text_IO.Put_Line("The new test value: " & Integer'Image(Test_Value));
  or
    delay 0.5;

    Ada.Text_IO.Put_Line("NOTE: Task did not respond for value " & Integer'Image(Test_Value) & "!");
  end select;
  Test_Value := 20;

  Task_1.Input(Test_Value);

  select
    Task_1.Retrieve(Test_Value);

    Ada.Text_IO.Put_Line("The new test value: " & Integer'Image(Test_Value));
  or
    delay 0.5;

    Ada.Text_IO.Put_Line("NOTE: Task did not respond for value " & Integer'Image(Test_Value) & "!");
  end select;
  Test_Value := 4;

    Task_1.Input(Test_Value);

  select
    Task_1.Retrieve(Test_Value);

    Ada.Text_IO.Put_Line("The new test value: " & Integer'Image(Test_Value));
  or
    delay 0.5;

    Ada.Text_IO.Put_Line("NOTE: Task did not respond for value " & Integer'Image(Test_Value) & "!");
  end select;

  Task_1.End_Task;
end Tasks_Guards;
