pageextension 50163 "G/L register" extends "G/L Registers"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {


        addafter("F&unctions")
        {
            action(PrintVoucher)
            {
                ApplicationArea = All;
                Caption = 'Print Voucher';

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(GLregister);
                    Report.Run(50170, true, false, GLregister);
                end;
            }
        }


    }

    var
        myInt: Integer;
        GLregister: Record "G/L Register";
}