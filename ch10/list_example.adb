-- list_example.adb:

with Ada.Containers.Doubly_Linked_Lists;
with Ada.Text_IO;

procedure List_Example is
  package Wagon_List is new
    Ada.Containers.Doubly_Linked_Lists(Integer);
  WL : Wagon_List.List;

  procedure Populate_List is
  begin
    WL.Append(New_Item => 23);
    WL.Append(New_Item => 24);
    WL.Append(New_Item => 20);
    WL.Append(New_Item => 25);
    WL.Append(New_Item => 22);
    WL.Append(New_Item => 23);
    WL.Append(New_Item => 21);
    WL.Append(New_Item => 22);
    WL.Append(New_Item => 24);
    WL.Append(New_Item => 22);

    WL.Insert(Before => WL.Find(21), New_Item => 34);
    WL.Insert(Before => WL.Reverse_Find(24), New_Item => 89);
  end Populate_List;

  procedure Print_List(
    Position : Wagon_List.Cursor) is
  begin
    Ada.Text_IO.Put_Line(
      "Item printed => " & Integer'Image(Wagon_List.Element(Position)));
  end Print_List;
begin
  Populate_List;

  WL.Iterate(Print_List'access);
end List_Example;
