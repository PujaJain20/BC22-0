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
    //AGT_PJ_02012023 ++
    trigger OnAfterGetRecord()
    var
    begin

        begin
            Salesshipment.Reset();

            Salesshipment.SetRange("Order No.", Rec."No.");
            if Salesshipment.FindFirst() then begin

                rec."Shipment Date" := Salesshipment."Posting Date"
            end;

        end;

    end;

    //AGT_PJ_02012023 --








    var

        PickInstructionCustom: Report PickInstructionCustom;
        Salesline: Record "Sales Line";
        salesHeader: record "Sales Header";
        WorkDate: Text;
        DateCalculation: Text;
        month: Text[20];
        Salesshipment: Record "Sales Shipment Header";

}