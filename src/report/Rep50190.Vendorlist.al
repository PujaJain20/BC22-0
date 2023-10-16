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
            column(TotalAmount; TotalAmount) { }
            column(Posting_Date; "Posting Date") { }
            column(RefDate; RefDate) { }

            column(LMTD; LMTD)
            {
            }
            column(Monthname; Monthname) { }
            column(TMTD; TMTD) { }
            column(FMTD; FMTD) { }
            column(FMA; FMA) { }
            column(SMA; SMA) { }
            column(LastNextMonth; LastNextMonth) { }
            column(Last3Month; Last3Month) { }
            column(Last4Month; Last4Month) { }
            column(Last5Month; Last5Month) { }
            column(Last6Month; Last6Month) { }
            column(Total; Total) { }

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
                }
            }
        }

    }
    local procedure currentMonth()

    begin
        LastDate := CalcDate('CM', RefDate);
        FirstDate := CalcDate('-CM', RefDate);
        Clear(TotalAmount);
        PurchaseInvoiline.Reset();
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", FirstDate, LastDate);
        if PurchaseInvoiline.FindFirst() then begin
            TotalAmount := PurchaseInvoiline."Amount Including VAT";
        end
    end;

    local procedure NextMonth()
    begin
        LastNextMonth := CalcDate('CM-1M', RefDate);
        FirstNextmonth := CalcDate('-CM-1M', RefDate);
        Clear(LMTD);
        PurchaseInvoiline.Reset();
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", FirstNextmonth, LastNextMonth);
        if PurchaseInvoiline.FindFirst() then begin
            LMTD := PurchaseInvoiline."Amount Including VAT";
        end
    end;

    local procedure ThirdMonth()
    begin
        Last3Month := CalcDate('CM-2M', RefDate);
        first3Month := CalcDate('-CM-2M', RefDate);
        Clear(TMTD);
        PurchaseInvoiline.Reset();
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", first3Month, Last3Month);
        if PurchaseInvoiline.FindFirst() then begin
            TMTD := PurchaseInvoiline."Amount Including VAT";
        end
    end;

    local procedure FourthMonth()
    begin
        Last4Month := CalcDate('CM-3M', RefDate);
        FIrst4Month := CalcDate('-CM-3M', RefDate);
        Clear(FMTD);
        PurchaseInvoiline.Reset();
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", FIrst4Month, Last5Month);
        if PurchaseInvoiline.FindFirst() then begin
            FMTD := PurchaseInvoiline."Amount Including VAT";
        end
    end;

    local procedure FiveMonth()
    begin
        Last5Month := CalcDate('CM-4M', RefDate);
        First5month := CalcDate('-CM-4M', RefDate);
        Clear(FMA);
        PurchaseInvoiline.Reset();
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", First5month, Last5Month);
        if PurchaseInvoiline.FindFirst() then begin
            FMA := PurchaseInvoiline."Amount Including VAT";
        end
    end;

    local procedure Sixmonth()
    begin
        Last6Month := CalcDate('CM-5M', RefDate);
        First6Month := CalcDate('-CM-5M', RefDate);
        Clear(SMA);
        PurchaseInvoiline.Reset();
        PurchaseInvoiline.SetRange("Document No.", "Purch. Inv. Header"."No.");
        PurchaseInvoiline.SetRange("Buy-from Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
        PurchaseInvoiline.SetRange("Posting Date", First6Month, Last6Month);
        if PurchaseInvoiline.FindFirst() then begin
            SMA := PurchaseInvoiline."Amount Including VAT";
        end
    end;

    local procedure TotalofAmount()
    begin
        Total := SMA + FMA + FMTD + TMTD + LMTD + TotalAmount;
    end;

    var

        RefDate: Date;
        LastDate: Date;
        FirstDate: Date;
        Expr1: Text;
        No: Text;
        TotalAmount: Decimal;
        LMTD: Decimal;
        FirstNextmonth: Date;
        LastNextMonth: date;
        Last3Month: date;
        first3Month: date;
        Last4Month: Date;
        FIrst4Month: date;
        Last5Month: Date;
        First5month: date;
        FMA: Decimal;
        Last6Month: Date;
        First6Month: date;
        SMA: Decimal;
        month1: Integer;
        Monthname: Text;

        Total: Decimal;


        TMTD: Decimal;
        FMTD: Decimal;

        PurchaseInvoiline: Record "Purch. Inv. Line";
        PurchaseinvoiceHeadeer: Record "Purch. Inv. Header";
        Monthtext: Integer;
}