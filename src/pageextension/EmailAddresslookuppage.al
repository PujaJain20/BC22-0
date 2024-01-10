pageextension 50291 EmailAddresslookuppage extends "Email Address Lookup"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        modify(Contacts)
        {
            trigger OnAfterAction()
            var
                myInt: Integer;
            begin


            end;
        }
    }
    // trigger OnAfterGetCurrRecord()
    // var
    //     myInt: Integer;
    // begin
    //     if contact.Get(rec."Contact No.") then begin
    //         if page.RunModal(Page::"Contact List")=Action::LookupOK then begin
    //             Contactlist.FlowEmailAddress();
    //         end;

    //     end;

    // end;
    // trigger OnclosePage()
    // var
    //     myInt: Integer;
    // begin
    //     if rec."E-Mail Address" <> '' then begin
    //         contact.Reset();
    //         contact.SetRange(Name, rec.Name);
    //         contact.SetRange("No.", Rec."Contact No.");

    //         // contact.SetRange();

    //         if contact.FindFirst() then begin

    //             //Address."E-Mail Address" := contact."BIlling E-mail";
    //             rec.Rename(contact."BIlling E-mail", contact.Name, Entity::Contact);

    //             rec.Mark(true);

    //         end;
    //     end;
    // end;



    var
        myInt: Integer;
        contact: Record Contact;
        Contactlist: Page "Contact List";


}