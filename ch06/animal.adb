-- animal.adb:

package body Animal is
  function Init(
    Name          : in    String;
    Legs          : in    Natural;
    WeightInGrams : in    Positive;
    HeightInCm    : in    Positive)
      return Creature is

    TempCreature : Creature;
  begin
    TempCreature.Name          := Ada.Strings.Unbounded.To_Unbounded_String(Name);
    TempCreature.Legs          := Legs;
    TempCreature.WeightInGrams := WeightInGrams;
    TempCreature.HeightInCm    := HeightInCm;

    return TempCreature;
  end Init;

  function Init return Creature is
    TempCreature : Creature;
  begin
    TempCreature.Name          := Ada.Strings.Unbounded.To_Unbounded_String("dog");
    TempCreature.Legs          := 4;
    TempCreature.WeightInGrams := 3000;
    TempCreature.HeightInCm    := 40;

    return TempCreature;
  end Init;

  procedure Set_Legs(
    Creat : in out Creature;
    Legs : in Natural) is

  begin
    Creat.Legs := Legs;
  end Set_Legs;

  procedure Set_Weight(
    Creat : in out Creature;
    WeightInGrams : in Positive) is

  begin
    Creat.WeightInGrams := WeightInGrams;
  end Set_Weight;

  procedure Set_Height(
    Creat : in out Creature;
    HeightInCm : in Positive) is

  begin
    Creat.HeightInCm := HeightInCm;
  end Set_Height;

  function Get_Legs(
    Creat : in out Creature)
      return Natural is

  begin
    return Creat.Legs;
  end Get_Legs;

  function Get_Weight(
    Creat : in out Creature)
      return Positive is

  begin
    return Creat.WeightInGrams;
  end Get_Weight;

  function Get_Height(
    Creat : in out Creature)
      return Positive is

  begin
    return Creat.HeightInCm;
  end Get_Height;

  overriding procedure Finalize(
    Creat : in out Creature) is
  begin
    Ada.Text_IO.Put_Line("Resetting values of Creat to defaults.");
    Ada.Text_IO.Put_Line(" Name: " & Ada.Strings.Unbounded.To_String(Creat.Name));

    Creat.Name          := Ada.Strings.Unbounded.Null_Unbounded_String;
    Creat.Legs          := 0;
    Creat.WeightInGrams := 1;
    Creat.HeightInCm    := 1;
  end Finalize;

  procedure Print_Record(Creat : in out Creature) is
  begin
    Private_Print_Record(Creat);
  end Print_Record;

  procedure Private_Print_Record(Creat : in out Creature) is
  begin
    Ada.Text_IO.Put_Line(" The animal:");
    Ada.Text_IO.Put_Line("  The name:        " & Ada.Strings.Unbounded.To_String(Creat.Name));
    Ada.Text_IO.Put_Line("  Number of legs:  " & Natural'Image(Creat.Legs));
    Ada.Text_IO.Put_Line("  Weight in grams: " & Positive'Image(Creat.WeightInGrams));
    Ada.Text_IO.Put_Line("  Height in cm:    " & Positive'Image(Creat.HeightInCm));
  end Private_Print_Record;
end Animal;
