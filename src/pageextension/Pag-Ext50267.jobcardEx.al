pageextension 50267 jobcardEx extends "Job Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("job type"; Rec."job type")
            {
                ApplicationArea = all;
            }
        }


        modify("Sell-to Customer No.")
        {
            ApplicationArea = all;
            Visible = true;
            Importance = Promoted;
        }
        modify("No.")
        {
            //Editable = false;

            trigger OnAssistEdit()
            var
                myInt: Integer;
            begin
                // if rec."Sell-to Customer No." = '' then begin
                /// CurrPage.Update(false);
                //  end
                //  else
                //   CurrPage.Update(false);

            end;
        }
        modify("Sell-to Customer Name")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                //   if rec."Sell-to Customer Name" = '' then begin
                //      CurrPage.Update(false);
            end;

            // end;
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
        //  Clear(New);
        // job.Reset();
        // job.SetRange("Bill-to Customer No.", rec."Bill-to Customer No.");
        //  job.SetRange("Bill-to Name", rec."Bill-to Name");
        // if job.FindLast() then begin
        // repeat
        //  Clear(New);
        //  if job."No." <> '' then begin
        //   if job."No." > New then
        //     New := job."No.";
        //  until job.Next() = 0;
        //  rec."No." := IncStr(New);
        //   rec.Insert();
        //  end
        // else begin
        //  rec."No." := rec."Bill-to Customer No." + '-' + '001';
        // rec.Insert();
        //  end;
        // end
        // else begin
        //  rec."No." := rec."Bill-to Customer No." + '-' + '001';
        //  rec.Insert();
        // end;
    end;

    //AGT_PJ_09/01/24 --


    var
        myInt: Integer;
        Newno: code[20];
        noseries: Record "No. Series";
        job: Record Job;
        customer: Record customer;
        New: Code[20];
}