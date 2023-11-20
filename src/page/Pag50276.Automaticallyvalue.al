page 50276 Automaticallyvalue
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = AutomaticallyValue;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(No; No)
                {
                    ApplicationArea = all;
                }
                field(StandardEnum; Rec.StandardEnum)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Value)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Populatedvalue: Page Autopopulatedvalue;

                begin
                    // if Populatedvalue.RunModal() = Action::OK then
                    //  Populatedvalue.AutopopulateValue(Rec."No.");




                end;
            }
        }
    }
    procedure Copyvalue(Num: Text[50])
    var
        myInt: Integer;

    begin

        No := num;
    end;



    var
        myInt: Integer;
        No: Text[50];
}