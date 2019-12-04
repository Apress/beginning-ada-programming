-- recursive_palindrome.adb:

with Ada.Text_IO;

procedure recursive_palindrome is
  -- this is where the actual work happens using recursion.
  function palindrome_func_rec(
    Word : in String;
    StartIndex : in Positive;
    EndIndex : in Positive)
      return Boolean is
  begin
    -- should the function ever get to this point, then that means we have searched over the entire string and it can be safely said that from start to
    --  finish, the entire string matches.  At this point, we can just relax and return true.
    if StartIndex > EndIndex
    then
      return True;
    end if;

    -- ensure that the individual characters are compared to one another and that they match.  If they match, then proceed with the rest of the string,
    --  otherwise, exit the function with a return of false.
    if Word(StartIndex) /= Word(EndIndex)
    then
      return False;
    else
      return palindrome_func_rec(Word, StartIndex + 1, EndIndex - 1);
    end if;
  end palindrome_func_rec;

  -- in this case I've decided to use a stepper function.  The beauty of these arrangements is that you can easily create very simple to call functions with
  --  minimal fuss while hiding some of the complexity away from the caller.  This does not have to be used only in a recursive function calls.
  function palindrome_func(
    Word : in String)
      return Boolean is
  begin
    -- check to ensure that at least a single character is passed in.
    if Word'Length = 0
    then
      Ada.Text_IO.Put_Line("ERROR: Palindrome needs to be of length one or grester.");

      return False;
    end if;

    return palindrome_func_rec(Word, 1, Word'Length);
  end palindrome_func;
begin
  Ada.Text_IO.Put_Line("Is 'racecar' a palindrome   : " & Boolean'Image(palindrome_func("racecar")));
  Ada.Text_IO.Put_Line("Is 'mom' a palindrome       : " & Boolean'Image(palindrome_func("mom")));
  Ada.Text_IO.Put_Line("Is 'malayalam' a palindrome : " & Boolean'Image(palindrome_func("malayalam")));
  Ada.Text_IO.Put_Line("Is 'ada lang' a palindrome  : " & Boolean'Image(palindrome_func("ada lang")));
end recursive_palindrome;

