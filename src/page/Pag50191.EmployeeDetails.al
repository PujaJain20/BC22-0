page 50191 "Employee Lists"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee Details";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ID; Rec.ID)
                {

                }
                field("Emp Name"; Rec."Emp Name")
                {
                    ApplicationArea = all;

                }
                field(Deapartment; Rec.Deapartment)
                {
                    ApplicationArea = all;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = all;
                }
                field("Joining Date"; Rec."Joining Date")
                {
                    ApplicationArea = all;
                }
                field("Emp Position"; Rec."Emp Position")
                {
                    ApplicationArea = all;
                }
                field("ID proof Name"; Rec."ID proof Name")
                {
                    ApplicationArea = all;

                }
                field("ID Proof"; Rec."ID Proof")
                {
                    ApplicationArea = all;
                }
                field("Contact Information"; Rec."Contact Information")
                {
                    ApplicationArea = all;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = all;
                }
                field("Company City"; Rec."Company City")
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