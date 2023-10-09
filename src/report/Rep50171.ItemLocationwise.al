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
            {
            }
            column(Description; Description) { }

            column(qty__on_Hand; "qty. on Hand") { }
            column(qty__on_hand2; "qty. on hand2") { }
            column(Rec_quantity; "Rec quantity") { }
            column(Rec_Quantity1; "Rec Quantity1") { }
            column(qty_invoiced1; "qty invoiced1") { }
            column(qty_invoiced; "qty invoiced") { }



            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                item_ledger_entry.Reset();
                Clear("qty. on Hand");
                Clear("qty. on hand2");

                item_ledger_entry.SetRange("Item No.", Item."No.");
                if item_ledger_entry.FindFirst() then begin
                    repeat
                        if ((item_ledger_entry."Location Code" = 'OUT.LOG.') OR (item_ledger_entry."Location Code" = 'OWN LOG.')) then
                            "qty. on Hand" := item_ledger_entry.Quantity + "qty. on hand2";
                        if ((item_ledger_entry."Location Code" = 'RED') OR (item_ledger_entry."Location Code" = 'GREEN') OR (item_ledger_entry."Location Code" = 'BLUE')) then
                            "qty. on hand2" := item_ledger_entry.Quantity + "qty. on hand2";

                    until item_ledger_entry.Next() = 0;
                end;


                Clear("Rec quantity");
                Clear("Rec Quantity1");
                Purchaseline.Reset();
                Purchaseline.SetRange("No.", item."No.");
                if Purchaseline.FindFirst() then begin
                    repeat
                        if ((Purchaseline."Location Code" = 'YELLOW') OR (Purchaseline."Location Code" = 'WHITE') OR (Purchaseline."Location Code" = 'BLUE')) then
                            "Rec quantity" := Purchaseline.Quantity + "Rec quantity";
                        if ((Purchaseline."Location Code" = 'OUT.LOG.') OR (Purchaseline."Location Code" = 'OWN LOG.')) then
                            "Rec Quantity1" := Purchaseline.Quantity + "Rec Quantity1";

                    until Purchaseline.Next() = 0;

                end;
                Clear("qty invoiced");
                clear("qty invoiced1");
                Salesline.Reset();
                Salesline.SetRange("No.", item."No.");
                if Salesline.FindFirst() then begin
                    repeat
                        if ((Salesline."Location Code" = 'YELLOW') OR (Salesline."Location Code" = 'WHITE') OR (Salesline."Location Code" = 'BLUE')) then
                            "qty invoiced" := Salesline.Quantity + "qty invoiced";
                        if ((Salesline."Location Code" = 'OUT.LOG.') OR (Salesline."Location Code" = 'OWN LOG.')) then
                            "qty invoiced1" := Salesline.Quantity + "qty invoiced1";

                    until Salesline.Next() = 0;

                end;

            end;

        }
    }
    var
        myInt: Integer;
        item_ledger_entry: Record "Item Ledger Entry";
        "qty. on Hand": Decimal;
        "qty. on hand2": Decimal;
        "qty invoiced": Decimal;
        "qty invoiced1": decimal;
        "Rec quantity": Decimal;
        "Rec Quantity1": Decimal;
        "Salesline": Record "Sales Line";
        "Purchaseline": Record "Purchase Line";

}

