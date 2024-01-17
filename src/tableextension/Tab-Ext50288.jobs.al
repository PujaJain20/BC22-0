tableextension 50288 jobs extends "Job Task"
{
    fields
    {
        field(50289; Buyout; Integer)
        {
            DataClassification = ToBeClassified;
        }
        modify("Job Task No.")
        {
            //AGT_PJ_03012023 ++
            trigger OnAfterValidate()
            var
                jobtaskNoCustom: Decimal;
                jobtaskNo: Code[20];
                jobcustomtext: Text[50];
            begin

                // Evaluate(jobtaskNoCustom, Rec."Job Task No.");
                // // jobtaskNoCustom:=Format(Rec."Job Task No.");
                // Message('%1', jobtaskNoCustom);
                // if ((jobtaskNoCustom / 2 = 0)) AND (jobtaskNoCustom / 2 <> 0) then begin
                //     Evaluate(jobcustomtext, Rec."Job Task No.");
                //     rec.Buyout := 0;
                //     // jobcustomtext := Format(jobtaskNoCustom);
                // end
                // else
                //     rec.Buyout := rec."Schedule (Total Cost)" + rec."Schedule (Total Price)";

            end;
            //AGT_PJ_03012023 --
        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var

}