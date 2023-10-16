report 50170 "Print Voucher"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Printvoucher.rdl';

    dataset
    {
        dataitem("G/L Register"; "G/L Register")
        {
            column(To_Entry_No_; "To Entry No.")
            {

            }
            column(From_Entry_No_; "From Entry No.") { }
            column(AccNO; AccNO) { }
            column(AccName; AccName) { }
            column(No; No) { }
            dataitem("G/L Entry"; "G/L Entry")
            {

                column(Document_No_; "Document No.") { }
                column(Description; Description) { }
                column(Entry_No_; "Entry No.") { }
                column(G_L_Account_Name; "G/L Account Name") { }
                column(G_L_Account_No_; "G/L Account No.") { }
                column(Posting_Date; "Posting Date") { }
                column(Debit_Amount; "Debit Amount") { }
                column(Credit_Amount; "Credit Amount") { }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code") { }
                column(Document_Type; "Document Type") { }
                column(External_Document_No_; "External Document No.") { }
                column(GetCurrencyCode; GetCurrencyCode) { }
                column(User_ID; "User ID") { }
                column(Source_Code; "Source Code") { }
                column(VNo; VNo) { }
                column(VName; VName) { }


                dataitem("Company Information"; "Company Information")
                {
                    column(Name; Name) { }
                }

                trigger OnPreDataItem()


                begin
                    "G/L Entry".SetRange("Entry No.", "G/L Register"."From Entry No.", "G/L Register"."To Entry No.");
                end;

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    if "G/L Entry"."Source Type" = "G/L Entry"."Source Type"::Vendor then begin
                        Vendor.Reset();
                        Vendor.SetRange("Document No.", "Document No.");
                        if Vendor.FindFirst() then begin
                            VNo := Vendor."Vendor No.";
                            Vname := Vendor."Vendor Name";
                        end;
                    end
                    else
                        Customer.SetRange("Document No.", "Document No.");
                    if Customer.FindFirst() then begin
                        VNo := Customer."Customer No.";
                        VName := Customer."Customer Name";
                    end;






                end;



            }





        }
    }


    var
        GeneralLedgerEntry: Record "G/L Entry";
        AccNO: Code[20];
        AccName: Text[50];
        No: Code[20];
        GLAccount: Record "G/L Account";
        Vendor: Record "Vendor Ledger Entry";
        Customer: Record "Cust. Ledger Entry";
        VNo: Code[20];
        VName: Text[100];


}