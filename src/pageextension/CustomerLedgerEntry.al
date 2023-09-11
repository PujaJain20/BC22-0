pageextension 50154 CustomerLedger extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("No.of item"; Rec."No.of item")
            {

                Caption = 'NO.of Item';
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