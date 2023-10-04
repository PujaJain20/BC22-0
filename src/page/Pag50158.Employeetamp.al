page 50158 "Employee tamp"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee Temporary";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Recref action")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ShowpoutputRecref(23);
                end;
            }
        }
    }
    procedure ShowpoutputRecref(TableNO: Integer)
    var
        myInt: Integer;
        Recref: RecordRef;
        Recref2: RecordRef;
        fieldRef1: FieldRef;
        recid: RecordId;
    begin
        Recref.Open(TableNO);
        fieldRef1 := Recref.Field(1);
        fieldRef1.value('10000');

        if Recref.Find('=') then begin
            recid := Recref.RecordId;
            Recref2.Get(recid);
            fieldRef1 := Recref2.field(2);
            Message('%1', fieldRef1);

        end;




    end;

    var
        myInt: Integer;
}