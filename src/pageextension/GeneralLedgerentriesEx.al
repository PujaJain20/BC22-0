pageextension 50251 generalLedgerEntriesEx extends "General Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("F&unctions")
        {
            action(DeleteRecords)
            {
                ApplicationArea = All;
                Caption = 'Delete Records';

                trigger OnAction()
                begin

                    if rec."Document No." <> ' ' then begin
                        rec.Delete();
                    end;

                end;
            }
        }
    }

    var
        myInt: Integer;
        generalledgerentries: Record "G/L Entry";
}