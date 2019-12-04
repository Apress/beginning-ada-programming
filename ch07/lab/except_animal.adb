-- except_animal.adb:

package body Except_Animal is
  function Init(
    Name          : in    String;
    Legs          : in    Natural;
    WeightInGrams : in    Positive;
    HeightInCm    : in    Positive)
      return Creature is

    TempCreature : Creature;
  begin
    if HeightInCm > 2000
    then
      raise Height_Exception;
    end if;

    if Legs > 1000
    then
      raise Legs_Exception;
    end if;
  
    TempCreature.Name          := Ada.Strings.Unbounded.To_Unbounded_String(Name);
    TempCreature.Legs          := Legs;
    TempCreature.WeightInGrams := WeightInGrams;
    TempCreature.HeightInCm    := HeightInCm;

    return TempCreature;
  exception
    when Height_Exception =>
      Ada.Text_IO.Put_Line("ERROR: Animal too tall.  Will return a default.");

      -- this is necessary so that the Init function will return something, it makes for cleaner code.
      return Init;
    when Legs_Exception =>
      Ada.Text_IO.Put_Line("ERROR: Animal has too many legs.  Will return a default.");

      -- this is necessary so that the Init function will return something, it makes for cleaner code.
      return Init;
    when others =>
      Ada.Text_IO.Put_Line("ERROR: Some other exception...  Will return a default.");

      -- this is necessary so that the Init function will return something, it makes for cleaner code.
      return Init;
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

  overriding procedure Finalize(
    Creat : in out Creature) is
  begin
    Creat.Name          := Ada.Strings.Unbounded.To_Unbounded_String("");
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
end Except_Animal;
