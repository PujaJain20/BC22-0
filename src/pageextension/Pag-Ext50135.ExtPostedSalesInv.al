
pageextension 50135 "Ext_PostedSalesInv" extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {

        addfirst("&Electronic Document")
        {
            action("Lavel Report")
            {
                ApplicationArea = All;
                Caption = 'LavelReport';
                //  Promoted = true;
                //  PromotedCategory = Category4;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(sales_invoice_Header);
                    Report.Run(50113, true, false, sales_invoice_Header);
                end;
            }
        }
    }

    var
        myInt: Integer;
        ReportVar: Report shipReport;
        sales_invoice_Header: Record "Sales Invoice Header";


}