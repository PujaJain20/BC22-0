page 50261 "Copy Links and Notes Dialog"
{
    PageType = StandardDialog;
    Caption = 'Copy Links and Notes Dialog';
    layout
    {
        area(content)
        {
            field(SourceItemNo; SourceItemNo)
            {
                ApplicationArea = All;
                Caption = 'Source Item No.';
                Editable = false;
            }
            field(SourceItemDesc; SourceItemDesc)
            {
                ApplicationArea = All;
                Caption = 'Source Item Description';
                Editable = false;
            }
            field(TargetItemNo; TargetItemNo)
            {
                ApplicationArea = All;
                Caption = 'Target Item No.';
                TableRelation = EmployeeInformation;

                trigger OnValidate()
                var
                    EmployeeInformation: Record EmployeeInformation;
                begin
                    if EmployeeInformation.Get(TargetItemNo) then
                        TargetItemDesc := EmployeeInformation.Description;
                end;
            }
            field(TargetItemDesc; TargetItemDesc)
            {
                ApplicationArea = All;
                Caption = 'Target Item Description';
                Editable = false;
            }
            field(RecordLinkType; RecordLinkType)
            {
                ApplicationArea = All;
                Caption = 'Type';
            }
        }
    }
    var
        SourceItemNo: Code[20];
        TargetItemNo: Code[20];
        SourceItemDesc: Text[100];
        TargetItemDesc: Text[100];
        RecordLinkType: Option Link,Note;
        LastLinkID: Integer;


    procedure SetItemInfo(NewItemNo: Code[20]; NewItemDesc: Text[100])
    begin
        SourceItemNo := NewItemNo;
        SourceItemDesc := NewItemDesc;
    end;

    // procedure CopyLinksAndNotes()
    // var
    //     SourceRecordLink: Record "Record Link";
    //     TargetRecordLink: Record "Record Link";
    //     SourceItem: Record EmployeeInformation;
    //     TargetItem: Record EmployeeInformation;
    // begin
    //     if SourceItem.Get(SourceItemNo) then
    //         if TargetItem.Get(1100) then begin
    //             SourceRecordLink.Reset();
    //             SourceRecordLink.SetRange("Record ID", SourceItem.RecordId);
    //             SourceRecordLink.SetRange(Type, RecordLinkType::Note);
    //             if SourceRecordLink.FindSet() then begin
    //                 LastLinkID := 0;
    //                 //  GetLastLinkID();
    //                 repeat
    //                     LastLinkID += 1;
    //                     TargetRecordLink.Init();
    //                     if RecordLinkType = RecordLinkType::Note then
    //                         SourceRecordLink.CalcFields(Note);
    //                     TargetRecordLink.Copy(SourceRecordLink);
    //                     TargetRecordLink."Link ID" := LastLinkID;
    //                     TargetRecordLink."Record ID" := TargetItem.RecordId;
    //                     TargetRecordLink.Insert();
    //                 until SourceRecordLink.Next() = 0;
    //             end;
    //         end;
    // end;

    // local procedure GetLastLinkID()
    // var
    //     RecordLink: Record "Record Link";
    // begin
    //     RecordLink.Reset();
    //     if RecordLink.FindLast() then
    //         LastLinkID := RecordLink."Link ID"
    //     else
    //         LastLinkID := 0;
    // end;
}