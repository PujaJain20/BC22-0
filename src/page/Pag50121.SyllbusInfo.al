page 50139 SyllbusInfomation
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SyllabusInfomation;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(id; Rec.id)
                {
                    ApplicationArea = All;

                }
                field(Syllabus_Name; Rec.Syllabus_Name)
                {
                    ApplicationArea = All;

                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;

                }
                field(fees; Rec.fees)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}