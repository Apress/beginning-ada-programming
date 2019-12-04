-- palindrome.adb:
--  Full disclosure, I did find the link to this function in this source:
--   http://rosettacode.org/wiki/Palindrome_detection#Ada

with Ada.Text_IO;

procedure palindrome is
  function palindrome_func(Text : in String) return Boolean is
  begin
    for Offset in 0 .. Text'Length / 2 - 1 loop
      if Text(Text'First + Offset) /= Text(Text'Last - Offset)
      then
        return False;
      end if;
    end loop;

    return True;
  end palindrome_func;
begin
  Ada.Text_IO.Put_Line("Is 'racecar' a palindrome   : " & Boolean'Image(palindrome_func("racecar")));
  Ada.Text_IO.Put_Line("Is 'mom' a palindrome       : " & Boolean'Image(palindrome_func("mom")));
  Ada.Text_IO.Put_Line("Is 'malayalam' a palindrome : " & Boolean'Image(palindrome_func("malayalam")));
  Ada.Text_IO.Put_Line("Is 'ada lang' a palindrome  : " & Boolean'Image(palindrome_func("ada lang")));
end palindrome;

