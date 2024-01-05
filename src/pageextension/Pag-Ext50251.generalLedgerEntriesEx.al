pageextension 50251 generalLedgerEntriesEx extends "General Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
    }
    //AGT_PJ_04/01/2023++
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
                    //AGT_PJ_05012023 ++
                    generalledgerentries.Reset();
                    generalledgerentries.SetRange("Document No.", Rec."Document No.");
                    if generalledgerentries.FindSet() then
                        repeat
                            generalledgerentries.Delete();
                        until generalledgerentries.Next() = 0;
                    //AGT_PJ_05012023 --

                end;
            }
        }
    }

    var
        myInt: Integer;
        generalledgerentries: Record "G/L Entry";
    //AGT_PJ_04/01/2023--
}