pageextension 50216 UsersetupEx extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Allow Posting From")
        {
            field("Approver E-mail"; Rec."Approver E-mail")
            {
                ApplicationArea = all;
            }
            field("Approver Name"; Rec."Approver Name")
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