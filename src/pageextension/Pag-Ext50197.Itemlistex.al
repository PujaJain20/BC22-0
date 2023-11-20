pageextension 50197 Itemlistex extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Functions)
        {
            action(ImportItem)
            {
                Caption = 'Import item';

                ApplicationArea = all;
                trigger Onaction()
                var
                    myInt: Integer;
                begin
                    Xmlport.Run(50195);
                end;
            }
            action(CopyNotes)
            {
                ApplicationArea = All;

                trigger OnAction()

                var
                    CopyLinksAndNotesDialog: Page "Copy Links and Notes Dialog";
                begin
                    // CopyLinksAndNotesDialog.SetItemInfo(Rec."No.", Rec.Description);
                    //  if CopyLinksAndNotesDialog.RunModal() = Action::OK then
                    //  CopyLinksAndNotesDialog.CopyLinksAndNotes();
                end;


            }
        }
    }

    var
        myInt: Integer;
}