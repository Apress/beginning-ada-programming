-- custom_string_cast.adb

with Ada.Text_IO;
with Ada.Strings.Fixed;

procedure Custom_String_Cast is
  subtype Currency_String is String(1 .. 3);
  US_Dollar : Currency_String         := "USD";
  Euro : Currency_String              := "EUR";
  British_Pound : Currency_String     := "GPB";
  Japan_Yen : Currency_String         := "JPY";
  Australian_Dollar : Currency_String := "AUD";
  HongKong_Dollar : Currency_String   := "HKD";
  NewZealand_Dollar : Currency_String := "NZD";
  --Dumpling : Currency_String          := "DUMPL";
  Singapore_Dollar : String           := "SGD";
begin
  Ada.Text_IO.Put_Line("US Dollar country code:          " & Ada.Strings.Fixed.Head(US_Dollar, 2));
  Ada.Text_Io.Put_Line(" Length of Currency_String: " & Natural'Image(US_Dollar'Length));
  Ada.Text_IO.Put_Line("Euro country code:               " & Ada.Strings.Fixed.Head(Euro, 2));
  Ada.Text_IO.Put_Line("British Pound country code:      " & Ada.Strings.Fixed.Head(British_Pound, 2));
  Ada.Text_IO.Put_Line("Japanese Yen country code:       " & Ada.Strings.Fixed.Head(Japan_Yen, 2));
  Ada.Text_IO.Put_Line("Australian Dollar country code:  " & Ada.Strings.Fixed.Head(Australian_Dollar, 2));
  Ada.Text_IO.Put_Line("Hong Kong Dollar country code:   " & Ada.Strings.Fixed.Head(HongKong_Dollar, 2));
  Ada.Text_IO.Put_Line("New Zealand Dollar country code: " & Ada.Strings.Fixed.Head(NewZealand_Dollar, 2));
  Ada.Text_IO.Put_Line("Singapore Dollar country code:   " & Ada.Strings.Fixed.Head(Singapore_Dollar, 2));
end Custom_String_Cast;
