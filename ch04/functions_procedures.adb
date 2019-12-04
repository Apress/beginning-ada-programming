-- functions_procedures.adb:

with Ada.Text_IO;

procedure functions_procedures is
  procedure test_proc(
    Val1 : in Integer;
    Val2 : in out Integer;
    Val3 : out Integer) is

  begin
    -- this will cause a compilation error.
    --Val1 := 4;
    Ada.Text_IO.Put_Line(" Input1 before assignment: " & Integer'Image(Val2));
    Val2 := 6;
    -- this value does not get set and instead you get some nonsense.
    Ada.Text_IO.Put_Line(" Input2 before assignment: " & Integer'Image(Val3));
    Val3 := 8;
    Ada.Text_IO.Put_Line(" Input2 after assignment: " & Integer'Image(Val3));

    return;
  end test_proc;

  function test_func(
    Val1 : in Integer;
    Val2 : out Integer)
      return Boolean is

  begin
    -- this will cause a compilation error.
    --Val1 := 22;
    Val2 := 44;

    return True;
  end test_func;

  Input1 : Integer := 23;
  Input2 : Integer := 92;
begin
  Ada.Text_IO.Put_Line(" Input1 before test_proc: " & Integer'Image(Input1));
  Ada.Text_IO.Put_Line(" Input2 before test_proc: " & Integer'Image(Input2));
  Ada.Text_IO.New_Line;

  test_proc(25, Input1, Input2);

  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line(" Input1 after test_proc: " & Integer'Image(Input1));
  Ada.Text_IO.Put_Line(" Input2 after test_proc: " & Integer'Image(Input2));
  Ada.Text_IO.New_Line;

  Ada.Text_IO.Put_Line(" test_func return value: " &
    Boolean'Image(test_func(54, Input2)));
  Ada.Text_IO.New_Line;

  Ada.Text_IO.Put_Line(" Input2 after test_proc: " & Integer'Image(Input2));
end functions_procedures;
