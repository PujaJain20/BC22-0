page 50128 listpart
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SyllabusInfo;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Syllabus_Name; Rec.Syllabus_Name)
                {
                    ApplicationArea = All;

                }
                field(id; Rec.id)
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