-- animal.ads:

with Ada.Strings.Unbounded;
with Ada.Finalization;
with Ada.Text_IO;

package Animal is
  type Creature is new Ada.Finalization.Controlled with private;

  -- this is the constructor where one can specify all of the inputs.
  function Init(
    Name          : in String;
    Legs          : in Natural;
    Weight_Grams : in Positive;
    Height_Cm    : in Positive)
      return Creature;

  -- this is the constructor where all of the inputs are defaults.  Also known as the default constructor.
  function Init return Creature;

  -- print out the entire record.
  procedure Print_Record(Creat : in out Creature);

  -- the setter and getter methods.
  procedure Set_Name(
    Creat : in out Creature;
    New_Name : in Ada.Strings.Unbounded.Unbounded_String);
  procedure Set_Name(
    Creat : in out Creature;
    New_Name : in String);
  procedure Set_Legs(
    Creat : in out Creature;
    New_Legs : in Natural);
  procedure Set_Weight_In_Grams(
    Creat : in out Creature;
    New_Weight : in Positive);
  procedure Set_Height_In_Cm(
    Creat : in out Creature;
    New_Height : in Positive);

private
  type Creature is new Ada.Finalization.Controlled with record
    Name            : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("");
    Legs            : Natural  := 0;
    Weight_In_Grams : Positive := 1;
    Height_In_Cm    : Positive := 1;
  end record;

  -- a private version of the procedure that will do the actual printing.
  procedure Private_Print_Record(Creat : in out Creature);

  overriding procedure Finalize(
    Creat : in out Creature);
end Animal;

