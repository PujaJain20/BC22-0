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

    var
        myInt: Integer;
        purchaseLine: Record "Purchase Line";
}