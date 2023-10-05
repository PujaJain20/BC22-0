pageextension 50189 "Purchase order Ex" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Functions_GetSalesOrder)
        {
            action(PurchaseInvoice)
            {
                ApplicationArea = All;
                Caption = 'Purchase invoice';

                trigger OnAction()
                begin
                    // Report.Run(50197);
                    CurrPage.SetSelectionFilter(Purchase_Header);
                    Report.Run(50197, true, false, Purchase_Header);

                end;
            }
        }
    }






    var
        myInt: Integer;
        "Purchase_Header": Record "Purchase Header";
}