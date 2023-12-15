pageextension 50288 jobtask extends "Job Task Lines Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Schedule (Total Cost)")
        {
            field(Buyout; Rec.Buyout)
            {
                ApplicationArea = all;
                trigger OnValidate()
                var
                    myInt: Integer;
                begin

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
        myInt: Integer;
        JobTask: Record "Job Task";
        JobNo: code[20];


}