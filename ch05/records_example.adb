-- records_example.adb:

with Ada.Float_Text_IO;
with Ada.Strings;
with Ada.Text_IO;

procedure records_example is
  type CarRecords is record
    NumOilChanges : Natural       := 0;
    NumCollisions : Natural       := 0;
    YearsOwned : Natural          := 0;
    Kilometers : Natural          := 0;
    MoneySpentMaintenance : Float := 0.0;
    MoneySpentRepairs : Float     := 0.0;
    TopSpeed : Float              := 0.0;
    CarLoanPrincipal : Float      := 0.0;
    Model : String(1 .. 11)       := "Porsche 911";
  end record;

  YourCar : CarRecords;
begin
  -- initialize some of the values to defaults.
  YourCar.NumOilChanges         := 23;
  YourCar.NumCollisions         := 1;
  YourCar.YearsOwned            := 3;
  YourCar.Kilometers            := 65923;
  YourCar.MoneySpentMaintenance := 6981.45;
  YourCar.MoneySpentRepairs     := 7200.00;
  YourCar.TopSpeed              := 215.0;
  YourCar.CarLoanPrincipal      := 1948.97;

  Ada.Text_IO.Put_Line(" Name of car:            " & YourCar.Model);
  Ada.Text_IO.Put_Line(" Number of oil changes: " & Natural'Image(YourCar.NumOilChanges));
  Ada.Text_IO.Put_Line(" Number of collisions:  " & Natural'Image(YourCar.NumCollisions));
  Ada.Text_IO.Put_Line(" Number years owned:    " & Natural'Image(YourCar.YearsOwned));
  Ada.Text_IO.Put_Line(" Number of kilometers:  " & Natural'Image(YourCar.Kilometers));
  Ada.Text_IO.Put(" Spent on maintenance:   ");
  Ada.Float_Text_IO.Put(YourCar.MoneySpentMaintenance, Aft => 2, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put(" Spent on repairs:       ");
  Ada.Float_Text_IO.Put(YourCar.MoneySpentRepairs, Aft => 2, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put(" Top speed:              ");
  Ada.Float_Text_IO.Put(YourCar.TopSpeed, Aft => 2, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put(" Car loan principal:     ");
  Ada.Float_Text_IO.Put(YourCar.CarLoanPrincipal, Aft => 2, Exp => 0);
  Ada.Text_IO.New_Line;
end records_example;

