-- simple_messages.adb:

with Ada.Text_IO;

procedure Simple_Messages is
  task type Intro_Task(Serial_Number : Integer) is
    entry Start;
  end Intro_Task;

  task body Intro_Task is
  begin
    accept Start;

    for Count in 1 .. 15 loop
      Ada.Text_IO.Put("Task serial number: " & Integer'Image(Serial_Number));
      Ada.Text_IO.New_Line;

      delay 0.5;
    end loop;
  end Intro_Task;

  Task_1 : intro_task(Serial_Number => 1);
  Task_2 : intro_task(Serial_Number => 2);
  Task_3 : intro_task(Serial_Number => 3);
begin
  Ada.Text_IO.Put_Line("About to begin executing tasks...");
  Task_1.Start;
  Task_2.Start;
  Task_3.Start;
end Simple_Messages;
