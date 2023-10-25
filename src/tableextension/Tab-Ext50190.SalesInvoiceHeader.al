tableextension 50190 SalesInvoiceHeader extends "Sales Invoice Header"
{
    fields
    {

        // Add changes to table fields here
        field(50177; "Customer Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}