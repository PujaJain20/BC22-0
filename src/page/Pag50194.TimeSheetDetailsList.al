page 50194 "TimeSheet Details"
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee TimeSheet Details";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("S.No."; Rec."S.No.")
                {
                    ApplicationArea = All;

                }
                field("Emp Name"; Rec."Emp Name")
                {
                    ApplicationArea = All;

                }
                field(ID; Rec.ID)
                {
                    ApplicationArea = all;

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
            action(TimesheetDetails)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //  EmpTimeSheetDetails.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;

        EmpTimeSheetDetails: Report "Employee TimeSheet Details";

}


