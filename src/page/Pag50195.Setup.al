page 50195 "Timesheet And Employee Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = "Employee Details";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
                field(Month; Month)
                {
                    ApplicationArea = all;
                }
                field(Date; Date)
                {
                    ApplicationArea = all;
                }
                //field("ID proof Name"; Rec."ID proof Name")
                //{
                //     ApplicationArea = all;

                // }
                //field("ID Proof"; Rec."ID Proof")

                //  {
                //      TableRelation = "Employee Details"."ID Proof";

                //  }
                field(Year; Year)
                {

                }
                field(Position; Position) { }




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

                    EmployeeTimeSheetDetails.CopyVarible(Month, Date, Name, Year, Position);

                    EmployeeTimeSheetDetails.Run();

                end;
            }
        }
    }

    var

        Month: text[50];
        Name: text[50];
        Date: Text[50];
        Year: Text[50];
        Position: Text[50];
        EmployeeTimeSheetDetails: Report "Employee TimeSheet Details";

}