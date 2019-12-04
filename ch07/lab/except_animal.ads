-- except_animal.ads:

with Ada.Strings.Unbounded;
with Ada.Finalization;
with Ada.Text_IO;

package Except_Animal is
  type Creature is new Ada.Finalization.Controlled with private;

  -- this is the constructor where one can specify all of the inputs.
  function Init(
    Name          : in     String;
    Legs          : in     Natural;
    WeightInGrams : in     Positive;
    HeightInCm    : in     Positive)
      return Creature;

  -- this is the constructor where all of the inputs are defaults.  Also known as the default constructor.
  function Init return Creature;

  -- print out the entire record.
  procedure Print_Record(Creat : in out Creature);
private
  Height_Exception : exception;
  Legs_Exception   : exception;

  type Creature is new Ada.Finalization.Controlled with record
    Name          : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("");
    Legs          : Natural  := 0;
    WeightInGrams : Positive := 1;
    HeightInCm    : Positive := 1;
  end record;

  -- a private version of the procedure that will do the actual printing.
  procedure Private_Print_Record(Creat : in out Creature);

  overriding procedure Finalize(
    Creat : in out Creature);
end Except_Animal;
