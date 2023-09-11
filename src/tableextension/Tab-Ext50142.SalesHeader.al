tableextension 50142 SalesHeader extends "Sales Header"
{
    fields
    {

        field(50143; "No.of item"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Line" where("Document Type" = filter(Order), "Document No." = field("No."), Type = filter(Item)));
        }


    }

    var
        myInt: Integer;
}