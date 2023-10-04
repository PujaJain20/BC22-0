page 50174 "Auto Caption Recref"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Table id"; "Table id")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        MyProcedure(18);
                    end;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    procedure MyProcedure("Table ID": Integer)


    var
        RecRef: RecordRef;
        varKeyRef: KeyRef;
        IsActive: Boolean;
    begin
        RecRef.Open("Table ID");
        varKeyRef := RecRef.KeyIndex(2);
        IsActive := varKeyRef.Active;
        Message('%1', IsActive);
    end;


    var
        myInt: Integer;
        "Table id": Integer;
}