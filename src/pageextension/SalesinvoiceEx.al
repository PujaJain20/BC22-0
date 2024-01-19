pageextension 50225 SalesInvoiceEx extends "Sales Invoice"
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
                PromotedCategory = Category7;

                trigger OnAction()
                begin

                    //CurrPage.SetSelectionFilter(SalesHeader);
                    Report.Run(50226, true, false, SalesHeader);


                end;
            }
        }
        addafter("P&osting")
        {
            action(DraftsInvoices)
            {
                ApplicationArea = all;
                Caption = 'Draft Invoices';
                Promoted = true;
                PromotedCategory = Category5;
                trigger OnAction()
                begin


                end;
            }
        }
    }

    var
        myInt: Integer;
        SalesHeader: Record "Sales Header";

}