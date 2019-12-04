-- write_record_to_file.adb:

with Ada.Strings.Unbounded;
with Ada.Text_IO;

procedure Write_Record_To_File is
  type Person_Rec is record
    Age        : Natural;
    First_Name : Ada.Strings.Unbounded.Unbounded_String;
    Last_Name  : Ada.Strings.Unbounded.Unbounded_String;
    -- True is for male and False is for female.
    Sex        : Boolean;
  end record;

  procedure Write_Person(
    Individual : in Person_Rec;
    Filename : in String) is

    F_Type : Ada.Text_IO.File_Type;
  begin
    -- open the file that I want, if it does not exist, create it.
    declare
    begin
      Ada.Text_IO.Open(
        File => F_Type,
        Mode => Ada.Text_IO.Out_File,
        Name => Filename);
    exception
      when Ada.Text_IO.Name_Error =>
        Ada.Text_IO.Create(
          File => F_Type,
          Mode => Ada.Text_IO.Out_File,
          Name => Filename);
    end;

    -- write to the file.
    Ada.Text_IO.Put(
      File => F_Type,
      Item => Ada.Strings.Unbounded.To_String(Individual.First_Name));
    Ada.Text_IO.Put(
      File => F_Type,
      Item => "  ");
    Ada.Text_IO.Put_Line(
      File => F_Type,
      Item => Ada.Strings.Unbounded.To_String(Individual.Last_Name));
    Ada.Text_IO.Put_Line(
      File => F_Type,
      Item => Natural'Image(Individual.Age));

    if Individual.Sex = True
    then
      Ada.Text_IO.Put_Line(File => F_Type, Item => "Man");
    else
      Ada.Text_IO.Put_Line(File => F_Type, Item => "Woman");
    end if;

    -- close the file.
    Ada.Text_IO.Close(File => F_Type);
  end Write_Person;

  Jim_T  : Person_Rec;
  Mary_Y : Person_Rec;
begin
  -- assign values to the Jim_T instance.
  Jim_T.Age        := 43;
  Jim_T.First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Jim");
  Jim_T.Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Thompson");
  Jim_T.Sex        := True;

  -- assign values to the Mary_Y instance.
  Mary_Y.Age        := 25;
  Mary_Y.First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Mary");
  Mary_Y.Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Yannis");
  Mary_Y.Sex        := False;

  Write_Person(Jim_T, "jim_file.txt");
  Write_Person(Mary_Y, "mary_file.txt");
end Write_Record_To_File;
