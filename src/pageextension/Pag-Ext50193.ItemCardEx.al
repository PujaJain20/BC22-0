pageextension 50193 "Item Card Ex" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(color; Rec.color)
            {
                ApplicationArea = all;
            }
            field(Style; Rec.Style)
            {
                ApplicationArea = all;
            }
        }
        addafter("Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;
            }
        }
        addafter(Inventory)
        {
            field("Qty. available"; Rec."Qty. available")
            {
                ApplicationArea = all;



            }
        }
        modify("Vendor No.")
        {
            Visible = true;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                GetINventory();
            end;
        }
        modify("Qty. on Asm. Component")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                GetINventory();
            end;
        }


    }

    actions
    {
        addafter(Functions)
        {
            action(PrintLabel)
            {
                ApplicationArea = All;
                Caption = 'Print Label';

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Item);
                    Report.Run(50186, true, false, Item);

                end;
            }

        }

    }

    trigger OnAfterGetRecord()
    begin
        GetINventory();
    end;

    procedure GetINventory()
    var

    begin
        Rec.CalcFields(Inventory, "Qty. on Sales Order", "Qty. on Asm. Component");
        Rec."Qty. available" := Rec.Inventory - Rec."Qty. on Sales Order" - Rec."Qty. on Asm. Component";
        CurrPage.Update(true);
    end;

    var

        Item: Record Item;
        vendor: Record Vendor;


}