-- talk_to_os.adb:

with Ada.Text_IO;

with GNAT.OS_Lib;

procedure Talk_To_OS is
  function OS_Command(
    Command   : in String;
    Arguments : in String)
      return Integer is

    Return_Value : Integer := 0;

    Arguments_List : GNAT.OS_Lib.Argument_List :=
       (--1 => new String'(Command),
        1 => new String'(Arguments));

    use type GNAT.OS_Lib.File_Descriptor;
    File_Descriptor : GNAT.OS_Lib.File_Descriptor := GNAT.OS_Lib.Standout;
  begin
    GNAT.OS_Lib.Spawn(
      Program_Name           => Command,
      Args                   => Arguments_List,
      Output_File_Descriptor => File_Descriptor,
      Return_Code            => Return_Value);

    return Return_Value;
  end OS_Command;
  
  Return_Int : Integer := 0;
begin
  --Return_Int := OS_Command(
  --  Command   => "cmd.exe",
  --  Arguments => "/C dir C:\Users\dai\Documents\introductory_ada_book\source_code\ch08\*.adb");
  Return_Int := OS_Command(
    Command   => "/bin/ls",
    Arguments => "-l");
end Talk_To_OS;
