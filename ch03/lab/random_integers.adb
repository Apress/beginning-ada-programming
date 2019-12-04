-- random_integers.adb:

with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;

procedure random_integers is
  subtype Vals is Positive range 1 .. 100;
  package Random100 is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);
  Gen : Random100.Generator;
  GeneratedNum : Vals := 1;
begin
  -- seed the random number generator so that it can be used later.
  Random100.Reset(Gen => Gen);
  -- generate a random number.
  GeneratedNum := Random100.Random(Gen => Gen);

  case GeneratedNum is
    when 1 .. 10 =>
      Ada.Text_IO.Put_Line("The random value is between 1 and 10.");
    when 11 .. 20 =>
      Ada.Text_IO.Put_Line("The random value is between 11 and 20.");
    when 21 .. 30 =>
      Ada.Text_IO.Put_Line("The random value is between 21 and 30.");
    when 31 .. 40 =>
      Ada.Text_IO.Put_Line("The random value is between 31 and 40.");
    when 41 .. 50 =>
      Ada.Text_IO.Put_Line("The random value is between 41 and 50.");
    when 51 .. 60 =>
      Ada.Text_IO.Put_Line("The random value is between 51 and 60.");
    when 61 .. 70 =>
      Ada.Text_IO.Put_Line("The random value is between 61 and 70.");
    when 71 .. 80 =>
      Ada.Text_IO.Put_Line("The random value is between 71 and 80.");
    when 81 .. 90 =>
      Ada.Text_IO.Put_Line("The random value is between 81 and 90.");
    when 91 .. 100 =>
      Ada.Text_IO.Put_Line("The random value is between 91 and 100.");
    when others =>
      -- here we are printing to the standard error output.  This is similar to the regular way that you usually print to console, but is its own path and is
      --  specifically designed for errors.  In this example, it's ok if you stick to standard output.
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error, "ERROR: The value is unknown.");
  end case;
end random_integers;

