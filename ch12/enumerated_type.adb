-- enumerated_type.adb:

with Ada.Text_IO;

procedure Enumerated_Type is
  type Robot_Actions is (forward, turn_left, turn_right,
    rotate_left, rotate_right, stop);
  Vacuum_Bot : Robot_Actions := stop;

  procedure Process_Action(Machine_Action : in Robot_Actions) is
  begin
    if Machine_Action = forward then
      Ada.Text_IO.Put_Line("The robot is moving forward.");
    elsif Machine_Action = turn_left then
      Ada.Text_IO.Put_Line("The robot is turning left.");
    elsif Machine_Action = turn_right then
      Ada.Text_IO.Put_Line("The robot is turning right.");
    elsif Machine_Action = rotate_left then
      Ada.Text_IO.Put_Line("The robot is rotating to the left.");
    elsif Machine_Action = rotate_right then
      Ada.Text_IO.Put_Line("The robot is rotating to the right.");
    else
      Ada.Text_IO.Put_Line("The robot is stopped.");
    end if;
  end Process_Action;
begin
  Process_Action(Vacuum_Bot);
  Vacuum_Bot := forward;
  Process_Action(Vacuum_Bot);
  Vacuum_Bot := turn_left;
  Process_Action(Vacuum_Bot);
  Vacuum_Bot := rotate_right;
  Process_Action(Vacuum_Bot);
  Vacuum_Bot := forward;
  Process_Action(Vacuum_Bot);
  Vacuum_Bot := turn_right;
  Process_Action(Vacuum_Bot);
  Vacuum_Bot := forward;
  Process_Action(Vacuum_Bot);
  Vacuum_Bot := stop;
  Process_Action(Vacuum_Bot);
end Enumerated_Type;
