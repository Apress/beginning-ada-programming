-- while_loop.adb:

with Ada.Text_IO;

procedure while_loop is
  River_Height : Natural := 0;
  Keep_Going   : Boolean := True;
begin
  while Keep_Going loop
    Ada.Text_IO.Put_Line(" The current value: " & Natural'Image(River_Height));

    if River_Height >= 20
    then
      Keep_Going := False;

      exit;
    end if;

    River_Height := River_Height + 2;
  end loop;

  Keep_Going := True;
  River_Height := 0;

  While_Loop2 :
  while Keep_Going loop
    Ada.Text_IO.Put_Line(" The current value: " & Natural'Image(River_Height));

    if River_Height >= 40
    then
      Keep_Going := False;

      exit While_Loop2;
    end if;

    River_Height := River_Height + 3;
  end loop While_Loop2;

  Ada.Text_IO.Put_Line("The final value: " & Natural'Image(River_Height));
end while_loop;
