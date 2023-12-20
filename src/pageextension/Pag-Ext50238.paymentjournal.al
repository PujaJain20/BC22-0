pageextension 50238 paymentjournal extends "Payment Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
        {
            field("Discount Amount"; Rec."Discount Amount")
            {
                ApplicationArea = all;
            }
            field("Approver status"; Rec."Approver status")
            {
                ApplicationArea = all;
                Editable = false;
            }

        }
    }

    actions
    {
        addafter(ApplyEntries)
        {
            action(SendApproval)
            {
                ApplicationArea = All;
                Caption = 'Send approval';

                trigger OnAction()
                var
                    EmailMessage: Codeunit "Email Message";
                    Email: Codeunit Email;
                    Usersetup: Record "User Setup";
                    User: Record User;
                    hyperlinkText: Text;
                    body: Text;
                    SMtp: Codeunit "SaaS Log In Management";
                    InStr: Instream;
                    OutStr: OutStream;
                    TempBlob: Codeunit "Temp Blob";
                begin
                    TempBlob.CreateInStream(InStr);
                    TempBlob.CreateOutStream(OutStr);
                    body := '<a href=' + GetUrl(CurrentClientType, CompanyName) + '&tenant=default&page=256&filter=%27Gen.%20Journal%20Line%27.%27Journal%20Template%20Name%27%20IS%20' + Rec."Journal Template Name" + '%20AND%20%27Gen.%20Journal%20Line%27%27.%27Journal%20Batch%20Name%27%20IS%20' + Rec."Journal Batch Name" + '&dc=0' + '>' + 'Click this link to open Page</a>';
                    //   body := hyperlinkText;
                    //  EmailMessage.AppendToBody(body);
                    if Usersetup.Get(UserId) then
                        EmailMessage.Create(Usersetup."Approver E-mail", 'This is the subject', body, true);
                    //EmailMessage.AppendToBody(body);
                    Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
                end;



            }
            action(status)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                    if fieldeditable = false then begin
                        fieldeditable := true;
                        rec."Approver status" := fieldeditable;
                    end
                    else
                        fieldeditable := false;
                    rec."Approver status" := fieldeditable;

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
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        purchaseinvoiceline: Record "Purch. Inv. Line";
        DiscountAmount: Decimal;
        genjournalline: Record "Gen. Journal Line";
        calculateValue: Decimal;
        DocumentNo: Code[20];
        CalculateDiscount: Decimal;
        fieldeditable: Boolean;
        batchname: code[10];



}