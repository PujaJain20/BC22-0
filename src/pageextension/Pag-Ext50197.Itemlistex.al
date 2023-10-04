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
        }
    }

    var
        myInt: Integer;
}