-- ma_recursion.adb:

with Ada.Task_Identification;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics;
with Ada.Text_IO;

procedure max_recursion is
  Minimum_Val : Integer := 1;
  Maximum_Val : Integer := 100;

  function generate_random_int(
    Min : in Integer;
    Max : in Integer)
      return Integer is

  begin
    -- if the min is not less than the max, then terminate this process.
    if (Min >= Max)
    then
      Ada.Task_Identification.Abort_Task(Ada.Task_Identification.Current_Task);
    end if;

    -- now that it is certain that the correct limits are observed, proceed to generate a random value within those limits.
    declare
      subtype Vals is Integer range Min .. Max;
      package CustomRandom is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);

      Gen : CustomRandom.Generator;
      GeneratedNum : Vals := Min;
    begin
      CustomRandom.Reset(Gen => Gen);
      GeneratedNum := CustomRandom.Random(Gen => Gen);

      return Integer(GeneratedNum);
    end;
  end generate_random_int;

  -- count the number of times that it took to get a number that is larger than the guess that is passed in.
  function count_tries(
    Largest : in Integer;
    Index : in Integer)
      return Integer is

    Random_Val : Integer := generate_random_int(Minimum_Val, Maximum_Val);
  begin
    -- check if the randomly generated value is less or more than the passed in number.
    if (Largest > Random_Val)
    then
      return count_tries(Largest, Index + 1);
    else
      return Index;
    end if;
  end count_tries;
begin
  -- find the number of times that are necessary in order to exceed the maximum value that we passed in.
  Ada.Text_IO.Put_Line(" Maximum number of tries: " & Integer'Image(count_tries(90, 1)));
end max_recursion;
