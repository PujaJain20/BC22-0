tableextension 50258 ContactEx extends Contact
{

    fields
    {
        field(50260; "BIlling E-mail"; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        // Add changes to table fields here
        modify("Mobile Phone No.")
        {
            //AGT_PJ_06/12/2023++
            trigger OnAfterValidate()
            var
                NUmlen: Integer;
                posstr: Integer;
                substr: Integer;
                spacestr1: Integer;
            begin
                NUmlen := StrLen("Mobile Phone No.");
                substr := StrPos("Mobile Phone No.", '+');
                spacestr1 := StrPos("Mobile Phone No.", ' ');
                if ((spacestr1 = 1)) then begin
                    Error('Blank Space is given as 1st Integer');
                end;

                if ((NUmlen < 13) OR (substr <> 1)) then begin
                    if Confirm('Total number of digit is not 13  are you sure you want to continue Yes/No', true, false) then begin
                        if NUmlen = 0 then begin
                        end
                        else
                            if substr <> 1 then begin
                                Error('MObile number should start with +');
                            end;

                    end
                    else begin
                        if substr <> 1 then begin
                            Error('Mobile Number should start only +');
                        end;

                        "Mobile Phone No." := ' ';

                    end;

                end;
            end;







        }
    }
    //AGT_PJ_06/12/2023 --

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
    //--AGT_PJ 06/12/2023

}