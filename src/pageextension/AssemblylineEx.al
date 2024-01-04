pageextension 50269 AssemblylineEx extends "Assembly Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field("Qty. on Hand"; Rec."Qty. on Hand")
            {
                ApplicationArea = all;
            }
            field("Qty. on Available"; Rec."Qty. on Available")
            {
                ApplicationArea = all;
            }
            field("Qty Available"; Rec."Qty Available")
            {
                ApplicationArea = all;
            }

        }
        modify("Quantity per")
        {
            trigger OnAfterValidate()
            var

            begin
                if Items.Get(Rec."No.") then begin
                    Items.CalcFields(Inventory, "Qty. on Sales Order", "Qty. on Asm. Component");

                    rec."Qty Available" := Items.Inventory - Items."Qty. on Sales Order" - items."Qty. on Asm. Component";


                end;
            end;
        }


    }
    trigger OnAfterGetRecord()
    var

    begin
        Getinventory();
    end;

    local procedure Getinventory()
    var
        Items: Record Item;
    begin
        if Items.Get(Rec."No.") then begin
            Items.CalcFields(Inventory);
            Items.CalcFields("Qty. on Sales Order");
            Items.CalcFields("Qty. on Asm. Component");
            rec."Qty. on Available" := Items.Inventory - (Items."Qty. on Sales Order" - items."Qty. on Asm. Component");


        end;
    end;

    var
        Items: Record Item;

}