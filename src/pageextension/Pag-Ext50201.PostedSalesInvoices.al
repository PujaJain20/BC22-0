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

                        salesInvoiceHeader.Reset();
                        salesInvoiceHeader.SetRange("Sell-to Customer No.", rec."Sell-to Customer No.");
                        if salesInvoiceHeader.FindFirst() then
                            repeat
                                salesInvoiceHeader."Customer Group" := Customer."Customer Group";
                                salesInvoiceHeader.Modify();
                            until salesInvoiceHeader.Next() = 0;

                    end;

                end;

            }
            action(DeleteOrder)
            {
                ApplicationArea = All;
                Caption = 'Delete order';

                trigger OnAction()
                begin
                    salesinvoiceLIne.Reset();
                    if salesInvoiceHeader.Get(rec."No.") then begin
                        salesInvoiceHeader.Delete();
                        salesinvoiceLIne.Reset();
                        salesinvoiceLIne.SetRange("Document No.", Rec."No.");
                        if salesinvoiceLIne.FindSet() then
                            repeat
                                salesinvoiceLIne.Delete();
                            until salesinvoiceLIne.next() = 0;
                        saleshipmentHeader.Reset();
                        saleshipmentHeader.SetRange("Order No.", Rec."Order No.");
                        if saleshipmentHeader.FindFirst() then begin
                            saleshipmentHeader.Delete();
                            ItemLedgerentry.Reset();
                            ItemLedgerentry.SetRange("Document No.", saleshipmentHeader."No.");
                            if ItemLedgerentry.FindSet() then
                                repeat
                                    ItemLedgerentry.Delete();
                                until ItemLedgerentry.Next() = 0;
                            salesShipmentLine.Reset();
                            salesShipmentLine.SetRange("Order No.", Rec."Order No.");
                            if salesShipmentLine.FindSet() then
                                repeat
                                    salesShipmentLine.Delete();
                                until salesShipmentLine.next = 0;
                            CustomerLedgerentry.Reset();
                            CustomerLedgerentry.SetRange("Document No.", Rec."No.");
                            if CustomerLedgerentry.FindFirst() then begin
                                CustomerLedgerentry.Delete();
                                GeneralLedgerentry.Reset();
                                GeneralLedgerentry.SetRange("Document No.", Rec."No.");
                                if GeneralLedgerentry.FindSet() then
                                    repeat
                                        GeneralLedgerentry.Delete();
                                    until GeneralLedgerentry.next = 0;
                            end;
                        end;
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
        salesinvoiceLIne: Record "Sales Invoice Line";
        saleshipmentHeader: Record "Sales Shipment Header";
        salesShipmentLine: Record "Sales Shipment Line";
        CustomerLedgerentry: Record "Cust. Ledger Entry";
        GeneralLedgerentry: Record "G/L Entry";
        ItemLedgerentry: Record "Item Ledger Entry";
}