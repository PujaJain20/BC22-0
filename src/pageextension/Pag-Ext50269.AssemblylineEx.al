pageextension 50269 AssemblylineEx extends "Assembly Order Subform"
{

    layout
    {

        //AGT_PJ_04/01/2023++
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


        }


    }
    trigger OnAfterGetRecord()
    var

    begin
        // Getinventory();
    end;

    local procedure Getinventory()
    var
        Items: Record Item;
    begin
        // if Items.Get(Rec."No.") then begin
        //     Items.CalcFields(Inventory, "Qty. on Sales Order", "Qty. on Asm. Component");

        //     rec."Qty Available" := Items.Inventory - (Items."Qty. on Sales Order" - items."Qty. on Asm. Component");


        // end;

    end;
    //AGT_PJ_04/01/2023--
    var
        Items: Record Item;

}