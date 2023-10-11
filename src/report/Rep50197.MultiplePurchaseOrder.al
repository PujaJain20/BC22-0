report 50197 "Multiple Purchase Order"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Purchaseorder.rdl';
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                dataitem(copyLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    dataitem(Pageloop; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(Posting_Date; "Purchase Header"."Posting Date")
                        { }
                        column(Line_No_; "Purchase Line"."Line No.") { }

                        column(VAT_Registration_No_; "Purchase Header"."VAT Registration No.") { }
                        column(Currency_Code; "Purchase Header"."Currency Code") { }
                        column(No_; "Purchase Header"."No.") { }

                        column(OutputNo; OutputNo) { }
                        column(CopyText; CopyText) { }
                        column(Document_No_; "Purchase Line"."Document No.") { }
                        column(Description; "Purchase Line".Description) { }
                        column(Line_Amount; "Purchase Line"."Line Amount") { }

                        column(Quantity; "Purchase Line".Quantity) { }
                        column(Unit_Price__LCY_; "Purchase Line"."Unit Price (LCY)") { }
                        column(Line_Discount__; "Purchase Line"."Line Discount %") { }
                        column(Line_Discount_Amount; "Purchase Line"."Line Discount Amount") { }
                        column(Amount_Including_VAT; "Purchase Line"."Amount Including VAT") { }

                        column(Item_No_; "Item No.") { }
                        column(Vendor_Name; "Vendor Name") { }
                        column(Vendor_No_; "Vendor No.") { }
                        column(City; City) { }
                        column(Address; Address) { }
                        column(Phone_No_; "Phone No.") { }
                        column(Total_Qty_; "Total Qty.") { }
                        column(Total_Exc_VAT; Total_Exc_VAT) { }
                        column(Total_Amt_Inc_VAT; Total_Amt_Inc_VAT) { }

                    }

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        if Number > 1 then begin
                            CopyText := FormatDocument.GetCOPYText;
                            OutputNo += 1;
                        end;
                    end;

                    trigger OnPreDataItem()
                    var
                        myInt: Integer;
                    begin
                        NoOfLoops := ABS(NoOfCopies) + 2;
                        CopyText := '';
                        SETRANGE(Number, 1, NoOfLoops);
                        OutputNo := 1;
                    end;

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    clear("Vendor Name");
                    Clear(City);
                    clear(Address);
                    Clear("Vendor No.");
                    Clear("Phone No.");

                    if Vendor.get("Buy-from Vendor No.") then begin

                        "Vendor Name" := Vendor.Name;
                        City := Vendor.City;
                        Address := Vendor.Address;
                        "Vendor No." := Vendor."No.";
                        "Phone No." := Vendor."Phone No.";


                    end;
                end;

            }
            trigger OnAfterGetRecord()


            begin
                "purchase rec line".Reset();
                "purchase rec line".SetRange("Document No.", "Purchase Header"."No.");
                if "purchase rec line".FindFirst() then
                    repeat
                        "Total Qty." := "Total Qty." + "purchase rec line".Quantity;
                        Total_Exc_VAT := Total_Exc_VAT + "purchase rec line"."Line Amount";
                        Total_Amt_Inc_VAT := Total_Amt_Inc_VAT + "purchase rec line"."Amount Including VAT";

                    until "purchase rec line".Next() = 0;

            end;

        }


    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {


                    field(NoOfCopies; NoOfCopies)
                    {

                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }



    var
        myInt: Integer;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
        "purchase rec line": Record "Purchase Line";
        "Item No.": Code[20];
        Vendor: Record Vendor;
        "Vendor Name": Text[100];
        "Vendor No.": Code[20];
        City: Text[30];
        Address: Text[100];
        "Phone No.": Text[30];
        "Total Qty.": Decimal;
        "Purchase Header var": Record "Purchase Header";
        "Total_Exc_VAT": Decimal;
        Total_Amt_Inc_VAT: Decimal;
        Total_VAT: Decimal;

}