pageextension 50197 Itemlistex extends "Item List"
{
    layout
    {
        // Add changes to page layout here\
        addafter("Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;
            }
            field("Qty. available"; Rec."Qty. available")
            {
                ApplicationArea = all;
            }
        }


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



            }
        }
    }
    trigger OnAfterGetRecord()

    begin

        Rec.CalcFields(Inventory, "Qty. on Sales Order", "Qty. on Asm. Component");
        Rec."Qty. available" := Rec.Inventory - Rec."Qty. on Sales Order" - Rec."Qty. on Asm. Component";
    end;


    var

        item: Record item;
}
