report 50167 "Temp Report"
{

    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'TempReport.rdl';


    dataset
    {
        dataitem("Employee Temporary"; "Employee Temporary")
        {
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Address; Address) { }



        }


    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        Customer.Reset();

        if customer.FindSet() then
            Customer.SetRange("No.", '10000..20000');
        repeat

            "Employee Temporary".Init();
            "Employee Temporary"."No." := Customer."No.";
            "Employee Temporary".Name := Customer.Name;
            "Employee Temporary".Address := Customer.Address;
            "Employee Temporary".Insert();
        until customer.Next() = 0;

    end;








    var
        myInt: Integer;
        Customer: Record Customer;
}