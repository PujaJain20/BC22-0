pageextension 50199 "PurchaselineEx" extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field(BagTag; Rec.BagTag)
            {
                ApplicationArea = all;

            }
            field("VAT %"; Rec."VAT %")
            {
                ApplicationArea = all;
                Editable = true;

            }
            field("Reference No."; Rec."Reference No.")
            {
                ApplicationArea = all;
            }

        }

        addafter("Total Amount Incl. VAT")
        {
            field("Total Amount Invoice"; Rec."Total Amount Invoice")
            {
                ApplicationArea = all;
                Editable = false;

            }
        }

        //AGT_PJ_02012023 ++
        modify("Qty. to Receive")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                if rec."Qty. to Receive" > 0 then
                    rec."Qty. to Invoice" := 0;
            end;

        }

        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                if rec.Quantity > 0 then begin
                    rec."Qty. to Receive" := 0;
                    rec."Qty. to Invoice" := 0;
                end
                else
                    rec."Qty. to Receive" := 0;
                rec."Qty. to Invoice" := 0;
            end;

        }
        //AGT_PJ_02012023 --
        modify("Line Discount Amount")
        {
            Visible = true;

        }

    }

    actions
    {

        addafter("&Line")
        {
            action(PtintReport)
            {
                ApplicationArea = All;
                Caption = 'Print Report';

                trigger OnAction()
                begin
                    purchaseLine.Reset();
                    CurrPage.SetSelectionFilter(purchaseLine);
                    Report.Run(50174, true, false, purchaseLine);

                end;
            }

        }

    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin

    end;

    procedure CalculateTotalAmount(PurchaseHeader: Record "Purchase Header")


    begin
        clear(TotalUnitcost);
        purchaseLine.Reset();
        purchaseLine.SetRange("Document No.", PurchaseHeader."No.");
        if purchaseLine.FindSet() then
            repeat
                TotalUnitcost := TotalUnitcost + (purchaseLine."Direct Unit Cost" * purchaseLine."Qty. to Invoice");
            until purchaseLine.Next() = 0;

        purchaseLine."Total Amount Invoice" := TotalUnitcost;
        purchaseLine.Modify();

    end;



    var
        myInt: Integer;
        purchaseLine: Record "Purchase Line";
        "Total Amount invoice": Decimal;
        Totalqty: Decimal;
        TotalUnitcost: Decimal;
        purchaseHeader: Record "Purchase Header";

}