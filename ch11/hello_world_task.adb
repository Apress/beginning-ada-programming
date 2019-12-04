-- hello_world_task.adb:

with Ada.Text_IO;

procedure Hello_World_Task is
  task type Hello_Task;

  task body Hello_Task is
  begin
    for count in 1 .. 15 loop
      Ada.Text_IO.put("Hello world from task!");
      Ada.Text_IO.new_line;

      delay 0.8;
    end loop;
  end Hello_Task;

  Task_1 : Hello_Task;
begin
  null;
end Hello_World_Task;
