page 50116 EmployeeInfo
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EmployeeInfo;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Emp id"; Rec."Emp id")
                {
                    ApplicationArea = All;

                }
                field("Emp Name"; Rec."Emp Name")
                {
                    ApplicationArea = all;

                }
                field("Emp Salary"; Rec."Emp Salary")
                {
                    ApplicationArea = all;
                }
                field("Emp address"; Rec."Emp address")
                {
                    ApplicationArea = all;
                }
                field("Emp City"; Rec."Emp City")
                {
                    ApplicationArea = all;
                }
                field(Language; Rec.Language)
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