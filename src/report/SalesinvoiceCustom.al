report 50226 "Sales invoice custom"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesinvoiceCustom.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Line_Discount__; "Line Discount %") { }

                dataitem("Company Information"; "Company Information")
                {

                    dataitem(copyloop; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        dataitem(Pageloop; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                            column(No; "Sales Line"."No.") { }
                            column(Description; "Sales Line".Description) { }
                            column(Quantity; "Sales Line".Quantity) { }
                            column(Line_Discount_Amount; "Sales Line"."Line Discount Amount") { }
                            column(Unit_Price; "Sales Line"."Unit Price") { }
                            column(No_; "Sales Header"."No.")
                            {
                            }
                            column(External_Document_No_; "Sales Header"."External Document No.") { }
                            column(Bill_to_Address; "Sales Header"."Bill-to Address") { }
                            column(Bill_to_Name; "Sales Header"."Bill-to Name") { }
                            column(Bill_to_County; "Sales Header"."Bill-to County") { }
                            column(Bill_to_City; "Sales Header"."Bill-to City") { }
                            column(Your_Reference; "Sales Header"."Your Reference") { }
                            column(Salesperson_Code; "Sales Header"."Salesperson Code") { }
                            column(Payment_Terms_Code; "Sales Header"."Payment Terms Code") { }
                            column(Shipment_Method_Code; "Sales Header"."Shipment Method Code") { }
                            column(Name; "Company Information".Name) { }
                            column(Address; "Company Information".Address) { }
                            column(City; "Company Information".City) { }
                            column(County; "Company Information".County) { }
                            column(Phone_No_; "Company Information"."Phone No.") { }
                            column(Home_Page; "Company Information"."Home Page") { }
                            column(E_Mail; "Company Information"."E-Mail") { }
                            column(TodayDate; TodayDate) { }
                            column(OutputNo; OutputNo) { }
                            column(Line_Amount_; "Sales Line"."Amount") { }
                            column(Line_Amount; "Sales Line"."Line Amount") { }
                            column(Line_Discount; "Sales Line"."Line Discount %") { }



                        }
                        trigger OnAfterGetRecord()
                        var
                            myInt: Integer;
                        begin
                            if Number > 1 then begin
                                CopyText := FormatDocument.GetCOPYText;
                                OutputNo += 1;
                            end
                            else begin
                                if NoOfCopies = 0 then begin
                                    Error('Noofcopies are not 0');
                                end;

                            end;
                            TodayDate := System.Today();

                        end;

                        trigger OnPreDataItem()
                        var
                            myInt: Integer;
                        begin
                            NoOfLoops := ABS(NoOfCopies) + 0;
                            CopyText := '';
                            SETRANGE(Number, 0, NoOfLoops);
                            OutputNo := 0;
                        end;
                    }







                }

            }
            // dataitem("Company Information"; "Company Information")
            // {
            //     column(Name; Name) { }
            //     column(Address; Address) { }
            //     column(Home_Page; "Home Page") { }
            //     column(Phone_No_; "Phone No.") { }
            //     column(E_Mail; "E-Mail") { }
            //     column(City; City) { }
            //     column(County; County) { }

            // }
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
        TodayDate: Date;
}