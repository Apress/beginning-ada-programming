-- throwing_exceptions.adb:

with Ada.Text_IO;

procedure Throwing_Exceptions is
  Custom_Exception_Just_For_Fun : exception;

  procedure Throw_Exception is
  begin
    Ada.Text_IO.Put_Line("Right about to throw an exception.");
    Ada.Text_IO.New_Line;

    raise Custom_Exception_Just_For_Fun;

    --Ada.Text_IO.Put_Line("This will never be printed to command line.");
  end Throw_Exception;

  procedure Catch_Exception is
  begin
    Ada.Text_IO.Put_Line("Right before receiving an exception!");
    
    Throw_Exception;

    Ada.Text_IO.Put_Line("Right after catching the exception.");
  exception
    when Custom_Exception_Just_For_Fun =>
      Ada.Text_IO.Put_Line("!!! The custom exception was received!!!");
    when others =>
      Ada.Text_IO.Put_Line("ERROR: I don't know what it is though...");
  end Catch_Exception;
begin
  Ada.Text_IO.Put_Line(" ==> Beginning the experiment!");

  Catch_Exception;

  Ada.Text_IO.Put_Line(" ==> Ending the experiment!");
end Throwing_Exceptions;
