-- data_crunching.adb:

with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Command_Line;
with Ada.Directories;
with Ada.Direct_IO;
with Ada.Text_IO;

procedure Data_Crunching is
  Original_File : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String(
    Source => "");

  procedure Manipulate_Contents(
    Contents : in out Ada.Strings.Unbounded.Unbounded_String) is

  begin
    -- this is a very simple example.  Feel free to make your own changes.  For example, change the code so that YOU
    --  enter what should be appended.
    Ada.Strings.Unbounded.Append(Contents, "    A hello!");
  end Manipulate_Contents;

  procedure Write_File(
    Contents  : in out Ada.Strings.Unbounded.Unbounded_String;
    File_Name : in Ada.Strings.Unbounded.Unbounded_String) is

    New_File : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String(
      Source => "");

    F_Type : Ada.Text_IO.File_Type;
  begin
    -- get the name of the file that is supposed to contain the new contents that were created.
    Ada.Text_IO.Put("Enter the name of the new file: ");
    New_File := Ada.Text_IO.Unbounded_IO.Get_Line;

    begin
      Ada.Text_IO.Open(
        File => F_Type,
        Mode => Ada.Text_IO.Out_File,
        Name => Ada.Strings.Unbounded.To_String(New_File));
    exception
      when Ada.Text_IO.Name_Error =>
        Ada.Text_IO.Create(
          File => F_Type,
          Mode => Ada.Text_IO.Out_File,
          Name => Ada.Strings.Unbounded.To_String(New_File));
    end;

    Ada.Text_IO.Put(
      File => F_Type,
      Item => Ada.Strings.Unbounded.To_String(Contents));

    Ada.Text_IO.Close(
      File => F_Type);
  end Write_File;
begin
  -- it is assumed that the first passed in variable is the the name of the original file.
  if Ada.Command_Line.Argument_Count = 1
  then
    Original_File := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Command_Line.Argument(1));
  else
    Ada.Text_IO.Put_Line(
      File => Ada.Text_IO.Standard_Error,
      Item => "ERROR: Incorrect number of command line arguments passed in.");

    return;
  end if;

  declare
    -- get the size of the file in question.
    File_Size : Natural := Natural(Ada.Directories.Size(Ada.Strings.Unbounded.To_String(Original_File)));

    -- make a specialty sized string.
    subtype File_String    is String(1 .. File_Size);
    package File_String_IO is new Ada.Direct_IO(File_String);

    F_Type        : File_String_IO.File_Type;
    File_Contents : File_String;

    U_File_Contents : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("");
  begin
    -- read in all of the contents of the file.
    File_String_IO.Open(
      File => F_Type,
      Mode => File_String_IO.In_File,
      Name => Ada.Strings.Unbounded.To_String(Original_File));

    File_String_IO.Read(
      File => F_Type,
      Item => File_Contents);

    File_String_IO.Close(
      File => F_Type);

    U_File_Contents := Ada.Strings.Unbounded.To_Unbounded_String(File_Contents);

    Manipulate_Contents(
      Contents => U_File_Contents);

    Write_File(
      Contents => U_File_Contents,
      File_Name => Original_File);
  exception
    -- catch any exceptions that pop up, such as when the file in question does not exist.  Exit with an error saying just that.
    when Ada.Text_IO.Name_Error =>
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error, "ERROR:Name_Error: The file does not exist.  Exiting.");

      return;
    when Ada.Text_IO.Status_Error =>
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error, "ERROR:Status_Error: The file does not exist.  Exiting.");

      return;
    when Ada.Text_IO.Use_Error =>
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error, "ERROR:Use_Error: The file does not exist.  Exiting.");

      return;
    when others =>
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error, "Error encountered, exiting.");

      return;
  end;
end Data_Crunching;
