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

            }


        }


    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        if JobTask."Job Task No." = '1100' then begin
            JobTask.Buyout := '0';
        end

    end;


    var
        myInt: Integer;
        JobTask: Record "Job Task";
        JobNo: code[20];

}