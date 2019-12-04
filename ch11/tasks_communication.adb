-- tasks_communication.adb:

with Ada.Text_IO;

procedure Tasks_Communication is
  task type Comm_Task is
    entry Input(Value : in Integer);
    entry Retrieve(Value : out Integer);
  end Comm_Task;

  task body Comm_Task is
    Internal_Value : Integer := 0;
  begin
    loop
      accept Input(Value : in Integer) do
        Internal_Value := Value * 2;
      end Input;
      accept Retrieve(Value : out Integer) do
        Value := Internal_Value;
      end Retrieve;
    end loop;
  end Comm_Task;

  Task_1 : Comm_Task;
  Test_Value : Integer := 10;
begin
  Task_1.Input(Test_Value);
  Task_1.Retrieve(Test_Value);
  Ada.Text_IO.Put_Line("The new test value: " & Integer'Image(Test_Value));

  Test_Value := 23;

  Task_1.Input(Test_Value);
  Task_1.Retrieve(Test_Value);
  Ada.Text_IO.Put_Line("The new test value: " & Integer'Image(Test_Value));

  Test_Value := 83;

  Task_1.Retrieve(Test_Value);

  Task_1.Input(Test_Value);
  Task_1.Retrieve(Test_Value);
  Ada.Text_IO.Put_Line("The new test value: " & Integer'Image(Test_Value));
end Tasks_Communication;
