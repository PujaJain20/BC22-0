pageextension 50267 jobcardEx extends "Job Card"
{
    layout
    {
        // Add changes to page layout here


        modify("Sell-to Customer No.")
        {
            ApplicationArea = all;
            Visible = true;
            Importance = Promoted;


        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    var

    begin
        //AGT_PJ_09/01/24 ++
        Clear(Newno);
        job.Reset();
        job.SetRange("Bill-to Customer No.", rec."Bill-to Customer No.");
        if job.FindLast() then begin
            // repeat
            if job."No." <> '' then begin
                if job."No." > Newno then
                    Newno := job."No.";
                //  until job.Next() = 0;
                rec."No." := IncStr(Newno);
                rec.Insert();
            end
            else begin
                rec."No." := rec."Bill-to Customer No." + '-' + '001';
                rec.Insert();
            end;
        end
        else begin
            rec."No." := rec."Bill-to Customer No." + '-' + '001';
            rec.Insert();
        end;




    end;

    //AGT_PJ_09/01/24 --


    var
        myInt: Integer;
        Newno: code[20];
        noseries: Record "No. Series";
        job: Record Job;
        customer: Record customer;
}