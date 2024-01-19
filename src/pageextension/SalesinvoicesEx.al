pageextension 50219 SalesinvoicesEx extends "Sales Invoice List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Invoice")
        {
            action(DraftsInvoice)
            {
                ApplicationArea = All;
                Caption = 'Draft Invoice';
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin

                    CurrPage.SetSelectionFilter(SalesHeader);
                    Report.Run(50226, true, false, SalesHeader);


                end;
            }
        }

    }

    var
        myInt: Integer;
        SalesHeader: Record "Sales Header";
}