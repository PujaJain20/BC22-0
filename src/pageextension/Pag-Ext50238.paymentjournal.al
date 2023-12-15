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
                    hyperlinkText := '<a href=' + GETURL(CURRENTCLIENTTYPE, CompanyName) + '&tenant=default&page=256&filter=%27Gen.%20Journal%20Line%27.%27Journal%20Template%20Name%27%20IS%20%27PAYMENT%27&dc=0&bookmark=32_UQAAAAJ7_1AAQQBZAE0ARQBOAFQAAAACe_9QAE0AVAAgAFIARQBHAAAAAIcQJw&mode=View' + '>' + 'Click this link to open Page</a>';
                    body := hyperlinkText;
                    EmailMessage.AppendToBody(body);
                    if Usersetup.Get(UserId) then
                        EmailMessage.Create(Usersetup."Approver E-mail", 'This is the subject', body, true);
                    //EmailMessage.AppendToBody(body);
                    Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
                end;



            }
        }



    }
    trigger OnAfterGetRecord()
    var
    begin
        Clear(DiscountAmount);
        Clear(calculateValue);
        VendorLedgerEntry.Reset();
        purchaseinvoiceline.Reset();
        VendorLedgerEntry.SetRange("Applies-to ID", Rec."Document No.");
        if VendorLedgerEntry.FindFirst() then begin

            purchaseinvoiceline.SetRange("Document No.", VendorLedgerEntry."Document No.");
            if purchaseinvoiceline.FindFirst() then begin
                if purchaseinvoiceline."Line Discount Amount" > 0 then begin
                    repeat
                        if VendorLedgerEntry."Document Type" = VendorLedgerEntry."Document Type"::Invoice then
                            DiscountAmount := DiscountAmount + (purchaseinvoiceline."Line Discount Amount" / 100) * (purchaseinvoiceline."Direct Unit Cost" * purchaseinvoiceline.Quantity);
                    until purchaseinvoiceline.Next() = 0;
                    CalculateDiscount := (purchaseinvoiceline.Amount - DiscountAmount);
                    Rec."Discount Amount" := CalculateDiscount;

                end
                else begin
                    if DiscountAmount = 0 then
                        repeat
                            if VendorLedgerEntry."Document Type" = VendorLedgerEntry."Document Type"::Invoice then
                                calculateValue := DiscountAmount + (purchaseinvoiceline."Direct Unit Cost" * purchaseinvoiceline.Quantity);
                        until purchaseinvoiceline.Next() = 0;
                    Rec."Discount Amount" := calculateValue;
                end;
            end;
        end;
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


}