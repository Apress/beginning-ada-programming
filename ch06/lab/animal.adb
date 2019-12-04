-- animal.adb:

package body Animal is
  function Init(
    Name         : in String;
    Legs         : in Natural;
    Weight_Grams : in Positive;
    Height_Cm    : in Positive)
      return Creature is

    Temp_Creature : Creature;
  begin
    Temp_Creature.Name            := Ada.Strings.Unbounded.To_Unbounded_String(Name);
    Temp_Creature.Legs            := Legs;
    Temp_Creature.Weight_In_Grams := Weight_Grams;
    Temp_Creature.Height_In_Cm    := Height_Cm;

    return Temp_Creature;
  end Init;

  function Init return Creature is
    Temp_Creature : Creature;
  begin
    Temp_Creature.Name            := Ada.Strings.Unbounded.To_Unbounded_String("dog");
    Temp_Creature.Legs            := 4;
    Temp_Creature.Weight_In_Grams := 3000;
    Temp_Creature.Height_In_Cm    := 40;

    return Temp_Creature;
  end Init;

  overriding procedure Finalize(
    Creat : in out Creature) is
  begin
    Creat.Name            := Ada.Strings.Unbounded.To_Unbounded_String("");
    Creat.Legs            := 0;
    Creat.Weight_In_Grams := 1;
    Creat.Height_In_Cm    := 1;
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
    Ada.Text_IO.Put_Line("  Weight in grams: " & Positive'Image(Creat.Weight_In_Grams));
    Ada.Text_IO.Put_Line("  Height in cm:    " & Positive'Image(Creat.Height_In_Cm));
  end Private_Print_Record;

  procedure Set_Name(
    Creat : in out Creature;
    New_Name : in Ada.Strings.Unbounded.Unbounded_String) is
  begin
    Creat.Name := New_Name;
  end Set_Name;

  procedure Set_Name(
    Creat : in out Creature;
    New_Name : in String) is
  begin
    Set_Name(Creat, Ada.Strings.Unbounded.To_Unbounded_String(New_Name));
  end Set_Name;

  procedure Set_Legs(
    Creat : in out Creature;
    New_Legs : in Natural) is
  begin
    Creat.Legs := New_Legs;
  end Set_Legs;

  procedure Set_Weight_In_Grams(
    Creat : in out Creature;
    New_Weight : in Positive) is
  begin
    Creat.Weight_In_Grams := New_Weight;
  end Set_Weight_In_Grams;

  procedure Set_Height_In_Cm(
    Creat : in out Creature;
    New_Height : in Positive) is
  begin
    Creat.Height_In_Cm := New_Height;
  end Set_Height_In_Cm;
end Animal;

