-- protected_types.adb:

with Ada.Text_IO;

procedure Protected_Types is
  protected type Protected_Value is
    entry Insert(An_Item : in Integer);
    entry Retrieve(An_Item : out Integer);
  private
    Counter : Integer;
    Accessible : Boolean := True;
  end Protected_Value;

  protected body Protected_Value is
    entry Insert(
      An_Item : in Integer)
        when Accessible is
    begin
      Accessible := False;
      Counter := An_Item * 3;
    end Insert;

    entry Retrieve(
      An_Item : out Integer)
        when not Accessible is
    begin
      An_Item := Counter;
      Accessible := True;
    end Retrieve;
  end Protected_Value;

  Protected_01 : Protected_Value;

  task type Access_Protected(Identifier : Integer) is
    entry Start(Input : in Integer);
    entry Quit;
  end Access_Protected;

  task body Access_Protected is
    Go_Loop : Boolean := True;
    Task_Custom_Value : Integer := 0;
    Task_Return_Value : Integer := 0;
    Serial_Number     : Integer := Identifier;
  begin
    accept Start(Input : in Integer) do
      Ada.Text_IO.Put_Line("Task in start entry!");
      Task_Custom_Value := Input;
    end Start;

    while Go_Loop loop
      select
        accept Quit do
          Ada.Text_IO.Put_Line("Task is asked to exit!");

          Go_Loop := False;
        end Quit;
      else
        select
          Protected_01.Insert(Task_Custom_Value);
          delay 1.0;
          Protected_01.Retrieve(Task_Return_Value);
          Ada.Text_IO.Put_Line("The return value: [ " & Integer'Image(Task_Return_Value) & " ] in task => " & Integer'Image(Serial_Number));
        or delay 0.5;
          Ada.Text_IO.Put_Line(" <=> ERROR! Did not acquire resource!");
        end select;
      end select;
    end loop;
  end Access_Protected;

  Task_01 : Access_Protected(Identifier => 1);
  Task_02 : Access_Protected(Identifier => 2);
  Task_03 : Access_Protected(Identifier => 3);
  Task_04 : Access_Protected(Identifier => 4);
  Task_05 : Access_Protected(Identifier => 5);
begin
  Task_01.Start(1);
  Task_02.Start(2);
  Task_03.Start(3);
  Task_04.Start(4);
  Task_05.Start(5);

  delay 6.0;

  Task_01.Quit;
  Task_02.Quit;
  Task_03.Quit;
  Task_05.Quit;
  Task_04.Quit;
end Protected_Types;
