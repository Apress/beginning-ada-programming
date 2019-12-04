-- multiple_tasks.adb:

with Ada.Text_IO;

procedure Multiple_Tasks is
  task type Simple_Task(Input : Integer);

  task body Simple_Task is
  begin
    for Count in 1 .. 15 loop
      Ada.Text_IO.put("Task: " & Integer'Image(Input));
      Ada.Text_IO.new_line;

      delay 0.8;
    end loop;
  end Simple_Task;

  Task_1 : Simple_Task(Input => 1);
  Task_2 : Simple_Task(Input => 2);
  Task_3 : Simple_Task(Input => 3);
begin
  null;
end Multiple_Tasks;
