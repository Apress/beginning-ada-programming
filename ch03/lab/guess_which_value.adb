-- guess_which_value.adb:

with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;

procedure guess_which_value is
  subtype Vals is Positive range 1 .. 100;
  package Random100 is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);
  Gen : Random100.Generator;
  GeneratedNum : Vals := 1;
  UserGuess : Vals    := 1;
  Guesses : Positive  := 1;
  Last : Natural      := 0;

  TempString : String (1 .. 3);
begin
  -- seed the random number generator so that it can be used later.
  Random100.Reset(Gen => Gen);
  -- generate a random number.
  GeneratedNum := Random100.Random(Gen => Gen);

  loop
    -- obtain input from the user from the command line and convert it to a number.
    Ada.Text_IO.Put(" Enter a guess => ");
    Ada.Text_IO.Get_Line(TempString, Last);
    UserGuess := Vals'Value(TempString(1 .. Last));

    if UserGuess = GeneratedNum
    then
      Ada.Text_IO.Put_Line("You've guessed the number!");
      Ada.Text_IO.Put_Line("  Number of guesses: " & Positive'Image(Guesses));

      return;
    elsif UserGuess > GeneratedNum
    then
      Ada.Text_IO.Put_Line("Your guess is too high.");
    else
      Ada.Text_IO.Put_Line("Your guess is too low.");
    end if;

    Ada.Text_IO.Put_Line("  Number of guesses: " & Positive'Image(Guesses));

    Guesses := Guesses + 1;
  end loop;
end guess_which_value;

