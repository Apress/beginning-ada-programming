-- sample_project.adb:

with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Text_IO;

procedure String_Int_Float is
  Sample_Int : Integer := 803;
  Sample_Float : Float := 1.23;

  String_Integer : String := "8915";
  String_Float : String   := "100.0";
  Output3 : Integer := 0;
  Output4 : Float   := 0.0;
begin
  Ada.Text_IO.Put_Line("The converted integer: " & Integer'Image(Sample_Int));
  Ada.Text_IO.Put_Line("The converted float:   " & Float'Image(Sample_Float));

  -- string to float and integer.
  Output3 := Integer'Value(String_Integer);
  Ada.Text_IO.Put("Output3: ");
  Ada.Integer_Text_IO.Put(Output3);
  Ada.Text_IO.New_Line;
  Output4 := Float'Value(String_Float);
  Ada.Text_IO.Put("Output4: ");
  Ada.Float_Text_IO.Put(Output4, 3, 1, 0);
  Ada.Text_IO.New_Line;
end String_Int_Float;
