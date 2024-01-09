tableextension 50268 jobCardEx extends Job
{
    fields
    {
        // Add changes to table fields here



    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
    trigger OnafterInsert()
    var

    begin
        //AGT_PJ_09/01/24 ++

        if rec."No." <> '' then begin
            rec."No." := ' ';

        end;

        //AGT_PJ_09/01/24 --

    end;





    var



}