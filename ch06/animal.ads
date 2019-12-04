-- animal.ads:

with Ada.Strings.Unbounded;
with Ada.Finalization;
with Ada.Text_IO;

package Animal is
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

  -- setter and getter methods.
  procedure Set_Legs(
    Creat : in out Creature;
    Legs : in Natural);
  procedure Set_Weight(
    Creat : in out Creature;
    WeightInGrams : in Positive);
  procedure Set_Height(
    Creat : in out Creature;
    HeightInCm : in Positive);
  function Get_Legs(
    Creat : in out Creature)
      return Natural;
  function Get_Weight(
    Creat : in out Creature)
      return Positive;
  function Get_Height(
    Creat : in out Creature)
      return Positive;
private
  type Creature is new Ada.Finalization.Controlled with record
    Name          : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    Legs          : Natural  := 0;
    WeightInGrams : Positive := 1;
    HeightInCm    : Positive := 1;
  end record;

  -- a private version of the procedure that will do the actual printing.
  procedure Private_Print_Record(Creat : in out Creature);

  overriding procedure Finalize(
    Creat : in out Creature);
end Animal;
