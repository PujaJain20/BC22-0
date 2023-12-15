page 50219 "Sales order queues"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Line";
    // AGT Sales order queues
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;


                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;

                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
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
            action(Labels)
            {
                ApplicationArea = All;
                Caption = 'Labels';
                // AGT_PJ 06/12/2023
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(salesline);
                    Report.Run(50208, true, false, salesline);

                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin

        Rec.SetRange(Type, Rec.Type::Item);
    end;

    var
        myInt: Integer;
        salesline: Record "Sales Line";
        salesheader: Record "Sales Header";
}