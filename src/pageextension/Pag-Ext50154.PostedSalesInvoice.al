pageextension 50154 PostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter(General)
        {
            field("Customer Group"; Rec."Customer Group")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        // Add changes to page actions here


    }

    var
        myInt: Integer;

}