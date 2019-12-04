-- generic_main.adb:

with Ada.Text_IO;

with Generic_Queue;

procedure Generic_Main is
  package newGen is new Generic_Queue(Integer);
  use type newGen.Queue_Instance;
  GQ : newGen.Queue_Instance := newGen.Init_Queue;

  Temp : Integer := 0;
begin
  Ada.Text_IO.Put_Line("The empty queue.");

  newGen.Print_Queue(GQ);

  Ada.Text_IO.Put_Line("The queue after inserting a bunch of values.");

  newGen.Push(GQ, 22);
  newGen.Push(GQ, 33);
  newGen.Push(GQ, 44);
  newGen.Push(GQ, 41);
  newGen.Push(GQ, 10);
  newGen.Push(GQ, 89);
  newGen.Push(GQ, 77);
  newGen.Push(GQ, 65);
  newGen.Push(GQ, 62);
  newGen.Push(GQ, 93);
  newGen.Push(GQ, 25);
  newGen.Push(GQ, 11);
  newGen.Push(GQ, 32);

  newGen.Print_Queue(GQ);

  Ada.Text_IO.Put_Line("The queue after inserting even more values.");

  newGen.Push(GQ, 22);
  newGen.Push(GQ, 33);
  newGen.Push(GQ, 44);
  newGen.Push(GQ, 41);
  newGen.Push(GQ, 10);
  newGen.Push(GQ, 89);
  newGen.Push(GQ, 77);
  newGen.Push(GQ, 65);
  newGen.Push(GQ, 62);
  newGen.Push(GQ, 93);
  newGen.Push(GQ, 25);
  newGen.Push(GQ, 11);
  newGen.Push(GQ, 32);
  newGen.Push(GQ, 22);
  newGen.Push(GQ, 33);
  newGen.Push(GQ, 44);
  newGen.Push(GQ, 41);
  newGen.Push(GQ, 10);
  newGen.Push(GQ, 89);
  newGen.Push(GQ, 77);
  newGen.Push(GQ, 65);
  newGen.Push(GQ, 62);
  newGen.Push(GQ, 93);
  newGen.Push(GQ, 25);
  newGen.Push(GQ, 11);
  newGen.Push(GQ, 32);
  newGen.Push(GQ, 22);
  newGen.Push(GQ, 33);
  newGen.Push(GQ, 44);
  newGen.Push(GQ, 41);
  newGen.Push(GQ, 10);
  newGen.Push(GQ, 89);
  newGen.Push(GQ, 77);
  newGen.Push(GQ, 65);
  newGen.Push(GQ, 62);
  newGen.Push(GQ, 93);
  newGen.Push(GQ, 25);
  newGen.Push(GQ, 11);
  newGen.Push(GQ, 32);

  newGen.Print_Queue(GQ);

  Ada.Text_IO.Put_Line("The queue after popping some values off of the start of it.");

  newGen.Pop(GQ, Temp);
  newGen.Pop(GQ, Temp);
  newGen.Pop(GQ, Temp);
  newGen.Pop(GQ, Temp);
  newGen.Pop(GQ, Temp);
  newGen.Pop(GQ, Temp);
  newGen.Pop(GQ, Temp);

  newGen.Print_Queue(GQ);
end Generic_Main;

