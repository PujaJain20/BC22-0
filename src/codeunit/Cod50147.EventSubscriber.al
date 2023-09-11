codeunit 50147 EventSubscriber
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::SampleCodeunit, onbeforemodifyCustomername, '', false, false)]
    local procedure Sampleevent(var Rec: Record Customer; var Ishandled: Boolean)
    begin
        Rec.Name := 'Allgrow Technology';
        Ishandled := true;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    local procedure CopyCustomField(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."No.of item" := SalesHeader."No.of item";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure CopyField(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgerEntry."No.of item" := GenJournalLine."No.of item";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesHeader', '', false, false)]
    local procedure CopySalesHeaderFromitemJournal(SalesHeader: Record "Sales Header"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine."NO. of Item" := SalesHeader."No.of item";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure CopyFromItemLIne(ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")

    begin
        NewItemLedgEntry."No.of item" := ItemJournalLine."NO. of Item";
    end;


    var
        Customer: Record Customer;
        SelesHeader: Record "Sales Header";


}