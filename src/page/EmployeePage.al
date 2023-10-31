page 50218 EmployeeInformation
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EmployeeInformation;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(FactBoxes)
        {


            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50218),
                              "No." = FIELD("No.");
                Visible = true;
            }

            part(Part2; CardpartPage)
            {
                Caption = 'Invoices';
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