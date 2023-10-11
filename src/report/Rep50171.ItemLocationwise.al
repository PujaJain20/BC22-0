report 50171 "Item Location wise"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Itemlocationwise.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            column(No_; "No.")
            { }
            column(Description; Description) { }
            column(qty__on_Hand; "qtyonHand") { }
            column(qty__on_hand2; "qtyonhand2") { }
            column(Rec_quantity; "Recquantity") { }
            column(Rec_Quantity1; "RecQuantity1") { }
            column(qty_invoiced1; "qtyinvoiced1") { }
            column(qty_invoiced; "qtyinvoiced") { }
            trigger OnAfterGetRecord()
            begin
                Clear("qtyonHand");
                Clear("qtyonhand2");
                item_ledger_entry.Reset();
                item_ledger_entry.SetRange("Item No.", Item."No.");
                if item_ledger_entry.FindFirst() then begin
                    repeat
                        if ((item_ledger_entry."Location Code" = 'OUT.LOG.') OR (item_ledger_entry."Location Code" = 'OWN LOG.')) then
                            "qtyonHand" := item_ledger_entry.Quantity + "qtyonhand2";
                        if ((item_ledger_entry."Location Code" = 'RED') OR (item_ledger_entry."Location Code" = 'GREEN') OR (item_ledger_entry."Location Code" = 'BLUE')) then
                            "qtyonhand2" := item_ledger_entry.Quantity + "qtyonhand2";
                    until item_ledger_entry.Next() = 0;
                end;
                Clear("Recquantity");
                Clear("RecQuantity1");
                Purchaseline.Reset();
                Purchaseline.SetRange("No.", item."No.");
                if Purchaseline.FindFirst() then begin
                    repeat
                        if ((Purchaseline."Location Code" = 'YELLOW') OR (Purchaseline."Location Code" = 'WHITE') OR (Purchaseline."Location Code" = 'BLUE')) then
                            "Recquantity" := Purchaseline.Quantity + "Recquantity";
                        if ((Purchaseline."Location Code" = 'OUT.LOG.') OR (Purchaseline."Location Code" = 'OWN LOG.')) then
                            "RecQuantity1" := Purchaseline.Quantity + "RecQuantity1";

                    until Purchaseline.Next() = 0;

                end;
                Clear("qtyinvoiced");
                clear("qtyinvoiced1");
                Salesline.Reset();
                Salesline.SetRange("No.", item."No.");
                if Salesline.FindFirst() then begin
                    repeat
                        if ((Salesline."Location Code" = 'YELLOW') OR (Salesline."Location Code" = 'WHITE') OR (Salesline."Location Code" = 'BLUE')) then
                            "qtyinvoiced" := Salesline.Quantity + "qtyinvoiced";
                        if ((Salesline."Location Code" = 'OUT.LOG.') OR (Salesline."Location Code" = 'OWN LOG.')) then
                            "qtyinvoiced1" := Salesline.Quantity + "qtyinvoiced1";
                    until Salesline.Next() = 0;
                end;

            end;

        }
    }
    var

        item_ledger_entry: Record "Item Ledger Entry";
        "Salesline": Record "Sales Line";
        "Purchaseline": Record "Purchase Line";
        "qtyonHand": Decimal;
        "qtyonhand2": Decimal;
        "qtyinvoiced": Decimal;
        "qtyinvoiced1": decimal;
        "Recquantity": Decimal;
        "RecQuantity1": Decimal;

}

