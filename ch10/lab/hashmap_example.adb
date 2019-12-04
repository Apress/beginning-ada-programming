-- hashmap_example.adb:

with Ada.Containers.Hashed_Maps;
with Ada.Text_IO.Unbounded_IO;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded;
with Ada.Integer_Text_IO;
with Ada.Strings.Hash;
with Ada.Text_IO;

procedure Hashmap_Example is
  use type Ada.Strings.Unbounded.Unbounded_String;

  type Guest is record
    Kids : Natural       := 0;
    Vegetarian : Boolean := False;
  end record;

  function Equivalent_Keys(
    Left  : in Ada.Strings.Unbounded.Unbounded_String;
    Right : in Ada.Strings.Unbounded.Unbounded_String)
      return Boolean is
  begin
    return Left = Right;
  end Equivalent_Keys;

  function Hash_Func(
    Key : in Ada.Strings.Unbounded.Unbounded_String)
      return Ada.Containers.Hash_Type is
  begin
    return Ada.Strings.Hash(Ada.Strings.Unbounded.To_String(Key));
  end Hash_Func;

  function U_To_Lower(
    Key : in Ada.Strings.Unbounded.Unbounded_String)
      return Ada.Strings.Unbounded.Unbounded_String is
  begin
    return Ada.Strings.Unbounded.To_Unbounded_String(
      Ada.Characters.Handling.To_Lower(
        Ada.Strings.Unbounded.To_String(
          Key)));
  end U_To_Lower;

  package Attendance_Tracker is new Ada.Containers.Hashed_Maps(
    Key_Type        => Ada.Strings.Unbounded.Unbounded_String,
    Element_Type    => Guest,
    Hash            => Hash_Func,
    Equivalent_Keys => Equivalent_Keys);

  Wedding_Attendance : Attendance_Tracker.Map;

  User_Input : Natural := 0;
  Total_Kids : Natural := 0;
  Control    : Natural := 0;

  String_Input : Ada.Strings.Unbounded.Unbounded_String
    := Ada.Strings.Unbounded.To_Unbounded_String("");
  Vegetarian_Confirmation : Ada.Strings.Unbounded.Unbounded_String
    := Ada.Strings.Unbounded.To_Unbounded_String("");

  Wedding_Guest : Guest;

  procedure Populate_Hash_Map is
  begin
    Wedding_Guest.Kids       := 3;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Aunt Annie"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 1;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Uncle Jim"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 0;
    Wedding_Guest.Vegetarian := True;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Mom"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 0;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Dad"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 4;
    Wedding_Guest.Vegetarian := True;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Sister Jamie"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 2;
    Wedding_Guest.Vegetarian := True;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Sister Amber"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 2;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Aunty Amy"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 0;
    Wedding_Guest.Vegetarian := True;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Uncle Kristopher"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 3;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Friend Ellie"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 0;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Fast Eddie"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 8;
    Wedding_Guest.Vegetarian := True;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Amy Shumacher"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 8;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Klaus Shumacher"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 3;
    Wedding_Guest.Vegetarian := True;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Mike Sonter"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 3;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Peter Griffin"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 3;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Lois Griffin"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 0;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Chris Griffin"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 0;
    Wedding_Guest.Vegetarian := True;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Stewart Griffin"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 0;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Meghan Griffin"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 0;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Quagmire"),
      New_Item => Wedding_Guest);

    Wedding_Guest.Kids       := 3;
    Wedding_Guest.Vegetarian := False;
    Wedding_Attendance.Insert(
      Key      => Ada.Strings.Unbounded.To_Unbounded_String("Homer Simpson"),
      New_Item => Wedding_Guest);
  end Populate_Hash_Map;
  
  procedure Print_Hash_Map(
    Position : Attendance_Tracker.Cursor) is
  begin
    Ada.Text_IO.Put_Line(
      "The key: " & Ada.Strings.Unbounded.To_String(Attendance_Tracker.Key(Position)) &
      "   Vegetarian: " & Boolean'Image(Attendance_Tracker.Element(Position).Vegetarian) &
      "   Kids: " & Natural'Image(Attendance_Tracker.Element(Position).Kids));
  end Print_Hash_Map;
begin
  -- add people to the list.
  Populate_Hash_Map;

  -- make an infinite loop for further data entry.
  loop
    -- print menu.
    Ada.Text_IO.Put_Line(" - Menu -");
    Ada.Text_IO.Put_Line(" - 1 - Enter new value."); 
    Ada.Text_IO.Put_Line(" - 2 - Delete existing value.");
    Ada.Text_IO.Put_Line(" - 3 - Print entire hashmap.");
    Ada.Text_IO.Put_Line(" - 4 - Exit application.");
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put(" - > ");

    -- wait for the user to enter input.
    declare
    begin
      Ada.Integer_Text_IO.Get(User_Input);
    exception
      when Ada.Text_IO.Data_Error =>
        Ada.Text_IO.Put_Line("ERROR: The entered value is not an integer, please try again!");

        -- set this to 0, that way the if-statements right below this will not process it and the above menu will be printed out again.
        User_Input := 0;
      when others =>
        Ada.Text_IO.Put_Line("ERROR: Another error has been discovered!");

        -- set this to 0, that way the if-statements right below this will not process it and the above menu will be printed out again.
        User_Input := 0;
    end;
    Ada.Text_IO.Skip_Line;
    Ada.Text_IO.New_Line;

    if User_Input = 1
    then
      -- enter the name of the person.
      Ada.Text_IO.Put_Line("Enter a new value.");
      Ada.Text_IO.Put("  Name - > ");
      String_Input := Ada.Text_IO.Unbounded_IO.Get_Line;
      Ada.Text_IO.New_Line;

      -- indicate whether person is a vegetarian.
      Ada.Text_IO.Put("  Vegetarian? (yes/y/no/n) - > ");
      Vegetarian_Confirmation := Ada.Text_IO.Unbounded_IO.Get_Line;
      Ada.Text_IO.New_Line;

      -- grab the number of kids that the person has.
      declare
      begin
        Ada.Text_IO.Put("  Number of kids - > ");
        Ada.Integer_Text_IO.Get(Total_Kids);
      exception
        when Ada.Text_IO.Data_Error =>
          Ada.Text_IO.Put_Line("ERROR: The entered value is not an integer, please try again!");

          Control := 1;
        when others =>
          Ada.Text_IO.Put_Line("ERROR: Another error has been discovered!");

          Control := 1;
      end;
      Ada.Text_IO.Skip_Line;
      Ada.Text_IO.New_Line;

      if Control = 0
      then
        -- process the confirmation.
        if (U_To_Lower(Vegetarian_Confirmation) = Ada.Strings.Unbounded.To_Unbounded_String("no"))
          or (U_To_Lower(Vegetarian_Confirmation) = Ada.Strings.Unbounded.To_Unbounded_String("n"))
        then
          Wedding_Guest.Kids       := Total_Kids;
          Wedding_Guest.Vegetarian := False;
          Attendance_Tracker.Insert(Container => Wedding_Attendance, Key => String_Input, New_Item => Wedding_Guest);
        elsif (U_To_Lower(Vegetarian_Confirmation) = Ada.Strings.Unbounded.To_Unbounded_String("y"))
          or (U_To_Lower(Vegetarian_Confirmation) = Ada.Strings.Unbounded.To_Unbounded_String("yes"))
        then
          Wedding_Guest.Kids       := Total_Kids;
          Wedding_Guest.Vegetarian := True;
          Attendance_Tracker.Insert(Container => Wedding_Attendance, Key => String_Input, New_Item => Wedding_Guest);
        else
          Ada.Text_IO.Put_Line(
            "WARNING: The confirmation that you entered is not recognized.");
        end if;
      end if;
    elsif User_Input = 2
    then
      Ada.Text_IO.Put("Delete a value - > ");
      String_Input := Ada.Text_IO.Unbounded_IO.Get_Line;
      Ada.Text_IO.New_Line;

      declare
      begin
        Attendance_Tracker.Delete(
          Container => Wedding_Attendance,
          Key => String_Input);
      exception
        when Constraint_Error =>
          Ada.Text_IO.Put_Line("The name: '" &
            Ada.Strings.Unbounded.To_String(String_Input) & "' is not found.");
        when others =>
          Ada.Text_IO.Put_Line("ERROR: Another error has been discovered!");
      end;
    elsif User_Input = 3
    then
      Wedding_Attendance.Iterate(Print_Hash_Map'access);
      Ada.Text_IO.New_Line;
    elsif User_Input = 4
    then
      exit;
    end if;
  end loop;
end Hashmap_Example;
