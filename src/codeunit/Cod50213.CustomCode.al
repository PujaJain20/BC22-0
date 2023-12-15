codeunit 50213 CustomCode
{

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromSalesLine, '', false, false)]
    local procedure OnAfterCopyItemJnlLineFromSalesLine(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine."Reference No." := SalesLine."Reference No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure CopyFromItemLIne(ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")

    begin
        NewItemLedgEntry."Reference No." := ItemJournalLine."Reference No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", OnAfterRecalculateSalesLine, '', false, false)]
    local procedure OnAfterRecalculateSalesLine(var CopyThisLine: Boolean; var FromSalesHeader: Record "Sales Header"; var FromSalesLine: Record "Sales Line"; var ToSalesHeader: Record "Sales Header"; var ToSalesLine: Record "Sales Line")
    begin
        ToSalesLine."Reference No." := FromSalesLine."Reference No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", OnAfterTransfldsFromSalesToPurchLine, '', false, false)]
    local procedure OnAfterTransfldsFromSalesToPurchLine(var FromSalesLine: Record "Sales Line"; var ToPurchaseLine: Record "Purchase Line")
    begin
        ToPurchaseLine."Reference No." := FromSalesLine."Reference No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", OnTransfldsFromSalesToPurchLineOnBeforeValidateQuantity, '', false, false)]
    local procedure OnTransfldsFromSalesToPurchLineOnBeforeValidateQuantity(var ToPurchaseLine: Record "Purchase Line"; FromSalesLine: Record "Sales Line")
    begin
        ToPurchaseLine."Reference No." := FromSalesLine."Reference No.";

    end;

    var

}