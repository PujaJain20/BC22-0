report 50190 Vendorlist
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Vendorlist.rdl';
    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.")
            {
            }
            column(No; No) { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_Contact; "Pay-to Contact") { }
            column(TotalAmount; TotalAmount[1]) { }
            column(TotalAmoun; TotalAmount[2]) { }
            column(TotalAmountof3Month; TotalAmount[3]) { }
            column(TotalAmountof4Month; TotalAmount[4]) { }
            column(TotalAmountof5Month; TotalAmount[5]) { }
            column(TotalAmountof6Month; TotalAmount[6]) { }
            column(Posting_Date; "Posting Date") { }
            column(ToggleMark; ToggleMark) { }
            column(RefDate; RefDate) { }
            column(Location; Location) { }
            column(Monthname; Monthname) { }
            column(LastNextMonth; LastNextMonth) { }
            column(Last3Month; Last3Month) { }
            column(InVoiceNo; InVoiceNo) { }
            column(Last4Month; Last4Month) { }
            column(Last5Month; Last5Month) { }
            column(Last6Month; Last6Month) { }
            column(Total; Total) { }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                trigger OnAfterGetRecord()
                begin
                    currentMonth();
                    NextMonth();
                    ThirdMonth();
                    FourthMonth();
                    FiveMonth();
                    Sixmonth();
                    TotalofAmount();
                end;
            }


        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(FilterDate; RefDate)
                    {
                        ApplicationArea = All;
                        Caption = 'FilterDate';

                    }
                    field(ToggleMark; ToggleMark)
                    {
                        ApplicationArea = all;
                        Caption = 'ToggleMark';
                    }
                }
            }
        }

    }
    local procedure currentMonth()
    begin
        LastDate := CalcDate('CM', RefDate);
        FirstDate := CalcDate('-CM', RefDate);
        PurchaseInvoiline.Reset();
        TotalAmount[1] := 0;
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", FirstDate, LastDate);
        if PurchaseInvoiline.Findset() then begin
            PurchaseInvoiline.CalcSums("Amount Including VAT");

            TotalAmount[1] := PurchaseInvoiline."Amount Including VAT";
            InVoiceNo := PurchaseInvoiline."Pay-to Vendor No.";


        end;
        Location := PurchaseInvoiline."Location Code";


    end;



    local procedure NextMonth()
    begin
        LastNextMonth := CalcDate('CM-1M', RefDate);
        FirstNextmonth := CalcDate('-CM-1M', RefDate);
        TotalAmount[2] := 0;
        PurchaseInvoiline.Reset();
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", FirstNextmonth, LastNextMonth);
        if PurchaseInvoiline.Findset() then begin
            PurchaseInvoiline.CalcSums("Amount Including VAT");

            TotalAmount[2] := PurchaseInvoiline."Amount Including VAT";
        end;


    end;


    local procedure ThirdMonth()
    begin
        Last3Month := CalcDate('CM-2M', RefDate);
        first3Month := CalcDate('-CM-2M', RefDate);
        PurchaseInvoiline.Reset();
        TotalAmount[3] := 0;
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", first3Month, Last3Month);
        if PurchaseInvoiline.Findset() then begin

            PurchaseInvoiline.CalcSums("Amount Including VAT");

            TotalAmount[3] := PurchaseInvoiline."Amount Including VAT";
        end;


    end;

    local procedure FourthMonth()
    begin
        Last4Month := CalcDate('CM-3M', RefDate);
        FIrst4Month := CalcDate('-CM-3M', RefDate);
        PurchaseInvoiline.Reset();
        TotalAmount[4] := 0;
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", FIrst4Month, Last5Month);
        if PurchaseInvoiline.Findset() then begin
            PurchaseInvoiline.CalcSums("Amount Including VAT");

            TotalAmount[4] := PurchaseInvoiline."Amount Including VAT";
        end;
    end;



    local procedure FiveMonth()
    begin
        Last5Month := CalcDate('CM-4M', RefDate);
        First5month := CalcDate('-CM-4M', RefDate);
        PurchaseInvoiline.Reset();
        TotalAmount[5] := 0;
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", First5month, Last5Month);
        if PurchaseInvoiline.Findset() then begin
            PurchaseInvoiline.CalcSums("Amount Including VAT");

            TotalAmount[5] := PurchaseInvoiline."Amount Including VAT";
        end;

    end;


    local procedure Sixmonth()
    begin
        Last6Month := CalcDate('CM-5M', RefDate);
        First6Month := CalcDate('-CM-5M', RefDate);
        PurchaseInvoiline.Reset();
        TotalAmount[6] := 0;
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", First6Month, Last6Month);
        if PurchaseInvoiline.Findset() then begin
            PurchaseInvoiline.CalcSums("Amount Including VAT");

            TotalAmount[6] := PurchaseInvoiline."Amount Including VAT";
        end;
    end;



    local procedure TotalofAmount()
    begin

        Total := TotalAmount[1] + TotalAmount[2] + TotalAmount[3] + TotalAmount[4] + TotalAmount[5] + TotalAmount[6];
    end;

    var

        RefDate: Date;
        LastDate: Date;
        FirstDate: Date;
        Expr1: Text;
        No: Text;
        TotalAmount: array[7] of Decimal;
        Location: Code[10];
        FirstNextmonth: Date;
        LastNextMonth: date;
        Last3Month: date;
        first3Month: date;
        Last4Month: Date;
        FIrst4Month: date;
        Last5Month: Date;
        First5month: date;
        InVoiceNo: Code[20];

        Last6Month: Date;
        First6Month: date;
        month1: Integer;
        Monthname: Text;

        Total: Decimal;
        ToggleMark: Boolean;

        PurchaseInvoiline: Record "Purch. Inv. Line";
        PurchaseinvoiceHeadeer: Record "Purch. Inv. Header";

}