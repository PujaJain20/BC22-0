pageextension 50155 ItemLedgerentry extends "Item Ledger Entries"
{
    layout
    {
        addafter(Description)
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