pageextension 50275 ContactlistEx extends "Contact List"
{
    layout
    {
        // Add changes to page layout here
        addafter("E-Mail")
        {
            field("BIlling E-mail"; Rec."BIlling E-mail")
            {
                ApplicationArea = all;
                // trigger OnLookup()
                // var
                //     myInt: Integer;
                // begin
                //     if rec.Get(rec."No.") then begin
                //         if page.RunModal(Page::"Contact List") = Action::LookupOK then
                //             Emailaddresslookup.FlowEmailAddress(rec."E-Mail");
                //     end;

                //  end;

            }
        }
    }

    actions
    {

        // Add changes to page actions here

    }
    procedure MyProcedure(emailAddress: Text[50])
    var
        myInt: Integer;
    begin
        if rec.Get(rec."No.") then begin
            emailAddress := rec."E-Mail";

        end;

    end;




    var
        myInt: Integer;
        Emailaddresslookup: Page "Email Address Lookup";
}