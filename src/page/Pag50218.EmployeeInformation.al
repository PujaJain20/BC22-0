page 50218 EmployeeInformation
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EmployeeInformation;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(FactBoxes)
        {


            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50218),
                              "No." = FIELD("No.");
                Visible = true;
            }
            systempart(PyamentTermsNotes; Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
            }
            systempart(PyamentTermsLinks; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = true;
            }

            part(Part2; CardpartPage)
            {
                Caption = 'Invoices';
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(CopyAction)
            {
                ApplicationArea = All;

                trigger OnAction()


                var
                    CopyLinksAndNotesDialog: Page EmployeeInformation;
                begin
                    //  SetItemInfo(Rec."No.");

                    CopyLinksAndNotes(Rec."No.");


                end;
            }
        }
    }
    // procedure SetItemInfo(NewItemNo: Code[20])
    //  begin
    //    SourceItemNo := NewItemNo;

    // end;

    procedure CopyLinksAndNotes(NewItemNo: Code[20])
    var
        SourceRecordLink: Record "Record Link";
        TargetRecordLink: Record "Record Link";
        SourceItem: Record EmployeeInformation;
        TargetItem: Record EmployeeInformation;
        RecordLinkMgt: Codeunit "Record Link Management";
        item: Record Item;
    begin
        SourceItemNo := NewItemNo;

        if TargetItem.Get(SourceItemNo) then begin
            //SourceRecordLink.SetCurrentKey("Link ID");
            // SourceRecordLink.Reset();
            // SourceRecordLink.SetRange("Record ID", SourceItem.RecordId);
            // SourceRecordLink.SetRange(Type, RecordLinkType::Note);
            // if SourceRecordLink.FindSet() then begin
            // LastLinkID := 0;
            //
            // GetLastLinkID();
            SourceRecordLink.Reset();
            SourceRecordLink.SetCurrentKey("Link ID");
            if not SourceRecordLink.FindLast() then begin
                TargetRecordLink.Init();
                TargetRecordLink."Link ID" := 1;
            end else begin
                TargetRecordLink.Init();
                TargetRecordLink."Link ID" := SourceRecordLink."Link ID" + 1;
            end;
            // LastLinkID := TargetRecordLink."Link ID";
            //LastLinkID += 1;
            //TargetRecordLink.Init();
            //if RecordLinkType = RecordLinkType::Note then
            // SourceRecordLink.CalcFields(Note);
            //   TargetRecordLink.Copy(SourceRecordLink);
            TargetRecordLink.Type := TargetRecordLink.Type::Note;
            TargetRecordLink."User ID" := UserId;
            TargetRecordLink."Record ID" := Rec.RecordId;
            RecordLinkMgt.WriteNote(TargetRecordLink, 'Test');
            // TargetRecordLink."Link ID" := LastLinkID;
            // TargetRecordLink."Record ID" := TargetItem.RecordId;
            if not TargetRecordLink.Insert() then
                TargetRecordLink.Modify();



        end;
    end;
    //  end;
    //  end;


    // local procedure GetLastLinkID()
    // var
    //     RecordLink: Record "Record Link";
    // begin
    //     RecordLink.Reset();
    //     if RecordLink.FindLast() then
    //         LastLinkID := RecordLink."Link ID"

    // end;





    var
        myInt: Integer;
        NotesCopy: Text;
        TargetRecordLink: Record "Record Link";
        SourceRecordLink: Record "Record Link";

        SourceItemNo: Code[20];
        TargetItemNo: Code[20];
        SourceItemDesc: Text[100];
        TargetItemDesc: Text[100];
        RecordLinkType: Option Link,Note;
        LastLinkID: Integer;
        EmployeeInformation: Record EmployeeInformation;

}