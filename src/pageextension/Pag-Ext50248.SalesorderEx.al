pageextension 50248 SalesorderEx extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
        addafter(Status)
        {
            field(DateCalculation; Rec.DateCalculation)
            {
                ApplicationArea = all;
            }

        }
        modify("Document Date")
        {
            Visible = true;
        }





    }


    actions
    {
        // Add changes to page actions here
        addafter("F&unctions")
        {
            action(Printreport)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(salesHeader);
                    Report.Run(50281, true, false, salesHeader);
                    Report.run(214, true, false, salesHeader);
                end;
            }
            action(BLind)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Report.Run(50281);
                end;
            }


        }
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin


    end;









    var

        PickInstructionCustom: Report PickInstructionCustom;
        Salesline: Record "Sales Line";
        salesHeader: record "Sales Header";
        WorkDate: Text;
        DateCalculation: Text;
        month: Text[20];
}