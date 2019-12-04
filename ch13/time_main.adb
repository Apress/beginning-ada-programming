-- time_main.adb:

with Time;
--use Time;

procedure Time_Main is
  Current_Time : Time.Time_Rec;
begin
  Time.Put_Line(Current_Time);

  Current_Time := Time."+"(24, Current_Time);

  Time.Put_Line(Current_Time);

  Current_Time := Time."+"(Current_Time, 293);

  Time.Put_Line(Current_Time);
end Time_Main;

--with Time;
--use Time;

--procedure Time_Main is
--  Current_Time : Time.Time_Rec;
--begin
--  Put_Line(Current_Time);

--  Current_Time := Current_Time + Natural(24);

--  Put_Line(Current_Time);

--  Current_Time := Current_Time + 293;

--  Put_Line(Current_Time);
--end Time_Main;

