pageextension 50189 "Purchase order Ex" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // addafter(Functions_GetSalesOrder)
        // {
        //     action(PurchaseInvoice)
        //     {
        //         ApplicationArea = All;
        //         Caption = 'Purchase invoice';
        //         Promoted = true;
        //         PromotedCategory = Category10;
        //         Image = Print;

        //         trigger OnAction()
        //         begin
        //             // Report.Run(50197);


        //             CurrPage.SetSelectionFilter(Purchase_Header);
        //             Report.Run(50004, true, false, Purchase_Header);

        //       end;
        //  }
        // }
        addafter(Functions_GetSalesOrder)
        {
            action(PO)
            {
                ApplicationArea = All;
                Caption = 'PO';
                Promoted = true;
                PromotedCategory = Category10;
                Image = Print;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Purchase_Header);
                    Report.Run(50227, true, false, Purchase_Header);
                end;
            }

        }

    }

    trigger OnAfterGetRecord()


    begin
        //CurrPage.PurchLines.Page.CalculateTotalAmount(Rec);


    end;

    var

        "Purchase_Header": Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        "Total Amount invoice": Decimal;
        Totalqty: Decimal;
        TotalUnitcost: Decimal;
        purchaseOrderSubform: Page "Purchase Order Subform";
        customcodeunit: Codeunit "Custom Codeunit";


}