tableextension 50148 SalesInvoiceHeader extends "Sales Invoice Header"

{

    fields
    {
        field(50123; Student_No; text[20]) { }
        field(50124; Student_Name; text[100]) { }
        field(50125; Student_Address; text[100]) { }
        field(50126; Student_city; text[100]) { }
        field(50143; "No. of Item"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Invoice Line" where("Document No." = field("No."), Type = filter(Item)));
        }


    }


    var
        myInt: Integer;
}