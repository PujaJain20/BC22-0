
tableextension 50118 postedsalesshipment extends "Sales Shipment Header"
{
    fields
    {
        field(50143; "NO. of Item"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Shipment Line" where("Document no." = field("No."), Type = filter(Item)));
        }
    }

    var
        myInt: Integer;
}