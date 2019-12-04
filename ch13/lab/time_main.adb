-- time_main.adb:

with Time;

procedure Time_Main is
  Current_Time : Time.Time_Rec;
begin
  Time.Put_Line(Current_Time);

  Current_Time := Time."+"(24, Current_Time);

  Time.Put_Line(Current_Time);

  Current_Time := Time."+"(Current_Time, 293);

  Time.Put_Line(Current_Time);

  Current_Time := Time."/"(Current_Time, 10);

  Time.Put_Line(Current_Time);

  Current_Time := Time."*"(Current_Time, 2);

  Time.Put_Line(Current_Time);
end Time_Main;

