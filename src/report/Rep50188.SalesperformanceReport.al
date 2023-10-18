report 50188 "Sales performance Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesPerformanceReport.rdl';


    dataset
    {

        dataitem("Sales Invoice Header"; "Sales Invoice Header")

        {
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Responsibility_Center; "Responsibility Center")
            {

            }
            column(Salesperson_Code; "Salesperson Code") { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_Post_Code; "Bill-to Post Code") { }
            column(Posting_Date; "Posting Date") { }
            column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code") { }

        }

    }







    var
        myInt: Integer;
}