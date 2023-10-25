pageextension 50201 PostedSalesInvoices extends "Posted Sales Invoices"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Electronic Document")
        {
            action(FlowData)
            {
                ApplicationArea = All;
                Caption = 'FlowData';

                trigger OnAction()
                begin

                    if Customer.Get(rec."Sell-to Customer No.") then begin
                        salesInvoiceHeader.SetRange("Sell-to Customer No.", rec."Sell-to Customer No.");
                        if salesInvoiceHeader.FindFirst() then
                            repeat
                                salesInvoiceHeader."Customer Group" := Customer."Customer Group";
                                salesInvoiceHeader.Modify();
                            until salesInvoiceHeader.Next() = 0;

                    end;


                end;







            }

        }
    }

    var
        myInt: Integer;
        Customer: Record Customer;
        salesInvoiceHeader: Record "Sales Invoice Header";
        mycode: Codeunit "Custom Codeunit";
}