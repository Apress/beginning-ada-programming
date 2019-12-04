-- dynamic_alloc_array.adb:

with Ada.Numerics.Discrete_Random;
with Ada.Integer_Text_IO;
with Ada.Text_IO;

procedure dynamic_alloc_array is
  Dim_1 : Positive := 1;
  Dim_2 : Positive := 1;

  type Matrix_Int_Type is array (Positive range <>, Positive range <>)
    of Integer;

  package RandomInt is new Ada.Numerics.Discrete_Random(Result_Subtype => Integer);
  Gen : RandomInt.Generator;
begin
  Ada.Integer_Text_IO.Get(Item => Dim_1);
  Ada.Integer_Text_IO.Get(Item => Dim_2);

  RandomInt.Reset(Gen => Gen);

  declare
    Matrix_Int : Matrix_Int_Type(1 .. Dim_1, 1 .. Dim_2)
      := (others => (others => 0));
  begin
    for IterA in Matrix_Int'Range(1) loop
      for IterB in Matrix_Int'Range(2) loop
        Matrix_Int(IterA, IterB) := RandomInt.Random(Gen => Gen);
      end loop;
    end loop;

    for IterA in Matrix_Int'Range(1) loop
      for IterB in Matrix_Int'Range(2) loop
        Ada.Integer_Text_IO.Put(Matrix_Int(IterA, IterB));
      end loop;

      Ada.Text_IO.New_Line;
    end loop;
  end;
end dynamic_alloc_array;

