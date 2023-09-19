page 50192 "Timesheet Detail"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee TimeSheet Details";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("S.No."; Rec."S.No.")
                {

                }
                field("Emp Name"; Rec."Emp Name")
                {
                    ApplicationArea = All;

                }
                field(Month; Rec.Month)
                {
                    ApplicationArea = All;

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;

                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;

                }
                field("Task Name"; Rec."Task Name")
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field(Hours; Rec.Hours)
                {
                    ApplicationArea = All;

                }
                field(Year; Rec.Year)
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