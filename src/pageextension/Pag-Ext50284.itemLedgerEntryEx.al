pageextension 50284 itemLedgerEntryEx extends "Item Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Reference No."; Rec."Reference No.")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addafter("F&unctions")
        {

            action(Nevigation)
            {

                ApplicationArea = All;
                Caption = 'Document Nevigate';
                trigger OnAction()
                begin

                    PurchasereceiptHeader.Reset();
                    PurchaseHeader.Reset();
                    PurchasereceiptHeader.SetRange("No.", Rec."Document No.");
                    if PurchasereceiptHeader.FindFirst() then begin
                        PurchaseHeader.SetRange("No.", PurchasereceiptHeader."Order No.");
                        if PurchaseHeader.FindFirst() then begin
                            Page.RunModal(9307, PurchaseHeader);
                        end
                        else begin
                            Postedpurchaseinvoice.Reset();
                            Postedpurchaseinvoice.SetRange("Order No.", PurchasereceiptHeader."Order No.");
                            if Postedpurchaseinvoice.FindFirst() then begin
                                page.RunModal(146, Postedpurchaseinvoice);
                            end;
                        end;
                    end;
                end;











            }
        }
    }

    var

        itemledgerentry: Record "Item Ledger Entry";
        PurchasereceiptHeader: Record "Purch. Rcpt. Header";
        PostedPurchasereceipt: page "Posted Purchase Receipt";
        Postedpurchaseinvoice: Record "Purch. Inv. Header";
        PurchaseHeader: Record "Purchase Header";
        SaleInvoiceHeader: Record "Sales Invoice Header";
        SaleShipmentHeader: Record "Sales Shipment Header";
        purchaseLine: Record "Purchase Line";

}

