-- longer_integers.adb:

with Ada.Text_IO;

procedure longer_integers is
  TestLI : Long_Long_Integer := 4;
begin
  Ada.Text_IO.Put_Line(" Long_Long_Integer:    " & Long_Long_Integer'Image(TestLI));
  Ada.Text_IO.Put_Line(" Long_Long_Integer min: [ " & Long_Long_Integer'Image(Long_Long_Integer'First) & " ] and max: [ " & Long_Long_Integer'Image(Long_Long_Integer'Last) & " ]");
end longer_integers;
