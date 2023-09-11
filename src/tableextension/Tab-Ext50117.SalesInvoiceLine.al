tableextension 50117 SalesInvoiceLine extends "Sales Invoice Line"
{
    fields
    {
        field(50111; Student_email; text[20]) { }
        field(50112; Student_Name2; text[100]) { }
        field(50114; Student_Address2; text[100]) { }
        field(50115; Student_city; text[100]) { }

    }

    var
        myInt: Integer;
}