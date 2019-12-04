-- access_type_example.adb:

with Ada.Unchecked_Deallocation;
with Ada.Text_IO;

procedure Access_Type_Example is
  type Int_Access is access all Integer;
  type Flo_Access is access all Float;
  type Str_Access is access all String;

  type Test_Rec is record
    Int_Point : Int_Access;
    Flo_Point : Flo_Access;
    Str_Point : Str_Access;
  end record;

  type Rec_Access is access Test_Rec;
  Rec_Point : Rec_Access;
  Backup_Ac : Rec_Access;

  Test_Int : aliased Integer := 94;

  -- functions for deallocation.
  procedure Deallocate is new Ada.Unchecked_Deallocation(Test_Rec, Rec_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation(String, Str_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation(Float, Flo_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation(Integer, Int_Access);
begin
  -- allocate memory of the pointers.
  Rec_Point := new Test_Rec;
  Rec_Point.Int_Point := Test_Int'Access;
  Rec_Point.Flo_Point := new Float'(0.0);
  Rec_Point.Str_Point := new String'("Hello world!");

  Backup_Ac := Rec_Point;

  -- print out the contents of the allocated memory.
  Ada.Text_IO.Put_Line("  The contents of our dynamically allocate structure:");
  Ada.Text_IO.Put_Line("    Integer: " & Integer'Image(Backup_Ac.Int_Point.all));
  Ada.Text_IO.Put_Line("    Float:   " & Float'Image(Backup_Ac.Flo_Point.all));
  Ada.Text_IO.Put_Line("    String:  " & Backup_Ac.Str_Point.all);

  -- give the allocated some assigned values for illustrative purposes.
  Backup_Ac.Int_Point.all := 299;
  Backup_Ac.Flo_Point.all := 3.14;
  Rec_Point.Str_Point.all := "Hello Ada!!!";

  -- print out the contents of the allocated memory.
  Ada.Text_IO.Put_Line("  The contents of our dynamically allocate structure:");
  Ada.Text_IO.Put_Line("    Integer: " & Integer'Image(Backup_Ac.Int_Point.all));
  Ada.Text_IO.Put_Line("    Float:   " & Float'Image(Backup_Ac.Flo_Point.all));
  Ada.Text_IO.Put_Line("    String:  " & Backup_Ac.Str_Point.all);

  -- deallocate memory of the pointers.
  --Deallocate(Rec_Point.Int_Point);
  Deallocate(Rec_Point.Flo_Point);
  Deallocate(Rec_Point.Str_Point);
  Deallocate(Rec_Point);

  Ada.Text_IO.Put_Line("  The contents of our dynamically allocate structure:");
  Ada.Text_IO.Put_Line("    Integer: " & Integer'Image(Backup_Ac.Int_Point.all));
end Access_Type_Example;
