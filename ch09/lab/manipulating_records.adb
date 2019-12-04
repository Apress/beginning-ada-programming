-- manipulating_records.adb:

with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

procedure Manipulating_Records is
  type Astronaut is record
    First_Name : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("");
    Last_Name : Ada.Strings.Unbounded.Unbounded_String  := Ada.Strings.Unbounded.To_Unbounded_String("");
    Address : Ada.Strings.Unbounded.Unbounded_String    := Ada.Strings.Unbounded.To_Unbounded_String("");
    Age : Natural                                       := 0;
    Alive : Boolean                                     := True;
  end record;

  Space_Men : array(1 .. 10) of Astronaut;

  procedure Initialize_Records is
  begin
    Space_Men(1).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Buzz");
    Space_Men(1).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Aldrin");
    Space_Men(1).Address    := Ada.Strings.Unbounded.To_Unbounded_String("Montclair, New Jersey, USA");
    Space_Men(1).Age        := 76;

    Space_Men(2).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Thomas");
    Space_Men(2).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Akers");
    Space_Men(2).Address    := Ada.Strings.Unbounded.To_Unbounded_String("St. Louis, Missouri, USA");
    Space_Men(2).Age        := 65;

    Space_Men(3).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Neil");
    Space_Men(3).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Armstrong");
    Space_Men(3).Address    := Ada.Strings.Unbounded.To_Unbounded_String("Wapakoneta, Ohio, USA");
    Space_Men(3).Age        := 82;
    Space_Men(3).Alive      := False;

    Space_Men(4).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Jeffrey");
    Space_Men(4).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Ashby");
    Space_Men(4).Address    := Ada.Strings.Unbounded.To_Unbounded_String("Dallas, Texas, USA");
    Space_Men(4).Age        := 62;

    Space_Men(5).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("John");
    Space_Men(5).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Blaha");
    Space_Men(5).Address    := Ada.Strings.Unbounded.To_Unbounded_String("San Antonio, Texas, USA");
    Space_Men(5).Age        := 73;

    Space_Men(6).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Curtis");
    Space_Men(6).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Brown");
    Space_Men(6).Address    := Ada.Strings.Unbounded.To_Unbounded_String("Elizabethtown, North Carolina, USA");
    Space_Men(6).Age        := 60;

    Space_Men(7).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Daniel");
    Space_Men(7).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Bursch");
    Space_Men(7).Address    := Ada.Strings.Unbounded.To_Unbounded_String("Bristol, Pennsylvania, USA");
    Space_Men(7).Age        := 58;

    Space_Men(8).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Robert");
    Space_Men(8).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Cabana");
    Space_Men(8).Address    := Ada.Strings.Unbounded.To_Unbounded_String("Minneapolis, Minnesota, USA");
    Space_Men(8).Age        := 67;

    Space_Men(9).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Kenneth");
    Space_Men(9).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Cameron");
    Space_Men(9).Address    := Ada.Strings.Unbounded.To_Unbounded_String("Cleveland, Ohio, USA");
    Space_Men(9).Age        := 66;

    Space_Men(10).First_Name := Ada.Strings.Unbounded.To_Unbounded_String("Robert");
    Space_Men(10).Last_Name  := Ada.Strings.Unbounded.To_Unbounded_String("Crippen");
    Space_Men(10).Address    := Ada.Strings.Unbounded.To_Unbounded_String("Beaumont, Texas, USA");
    Space_Men(10).Age        := 65;
  end Initialize_Records;

  procedure Delete_Substring(
    Original_String : in Ada.Strings.Unbounded.Unbounded_String;
    Deletion        : in String) is

    Start_Val  : Natural := 0;
    Finish_Val : Natural := 0;
  begin
    -- first ensure that the substring -- Deletion -- actually does exist in the Original_String.
    Start_Val := Ada.Strings.Unbounded.Index(Original_String, Deletion);
    
    if (Start_Val = 0) then
      Ada.Text_IO.Put_Line("WARNING: The string [ " & Ada.Strings.Unbounded.To_String(Original_String)
        & " ] does not have the character """ & Deletion & """.");

      return;
    end if;

    -- now, delete the string in question and display the resulting string.
    Finish_Val := Deletion'Length;

    Ada.Text_IO.Put(" !!! This is the original string: [ " &
      Ada.Strings.Unbounded.To_String(Original_String) & " ] This is the new string [ ");
    Ada.Text_IO.Unbounded_IO.Put(
      Ada.Strings.Unbounded.Delete(Original_String, Positive(Start_Val), Start_Val + Finish_Val));
    Ada.Text_IO.Put_Line(" ]");
  end Delete_Substring;

  procedure Occurrence_Counter(
    Original_String : in Ada.Strings.Unbounded.Unbounded_String;
    Sub_String      : in String) is

    Total : Natural := 0;
  begin
    -- count the total number of instances of the sub-string.
    Total := Ada.Strings.Unbounded.Count(Original_String, Sub_String);

    -- print out the total number of counts that were done.
    Ada.Text_IO.Put_Line("The total number of counts of [ " &
      Sub_String & " ] is [ " & Natural'Image(Total) & " ].");
  end Occurrence_Counter;
begin
  -- initialize our population of astronauts at first.
  Initialize_Records;

  for Iteration in Space_Men'Range loop
    Ada.Text_IO.Put_Line("This is iteration:" & Positive'Image(Iteration));
    Delete_Substring(Space_Men(Iteration).Address, "Texas,");
    Occurrence_Counter(Space_Men(Iteration).Address, "a");
    Ada.Text_IO.New_Line;
  end loop;
end Manipulating_Records;
