report 50195 "Employee TimeSheet Details"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'EmpTimeSheetDetails.rdl';


    dataset
    {
        dataitem("Employee TimeSheet Details"; "Employee TimeSheet Details")
        {
            //  RequestFilterFields = "Month", "Emp Name", Date;
            column(ID; ID)
            {
            }
            column(Emp_Name; "Emp Name") { }
            column(Date; Date) { }
            column(Description; Description) { }
            column(Hours; Hours) { }
            column(Project_Name; "Project Name") { }
            column(Task_Name; "Task Name") { }
            column(S_No_; "S.No.") { }
            dataitem("Employee Details"; "Employee Details")

            {
                DataItemLink = ID = field(ID);
                column(Joining_Date; "Joining Date") { }
                column(Company_Name; "Company Name") { }
                column(Emp_Position; "Emp Position") { }
                column(City; City) { }
                column(Deapartment; Deapartment) { }
                column(ID_Proof; "ID Proof") { }
                column(Company_City; "Company City") { }

            }


            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin

                "Employee TimeSheet Details".SetFilter(Month, Month2);
                if "Employee TimeSheet Details".FindFirst() then
                    Month2 := "Employee TimeSheet Details".Month;
                "Employee TimeSheet Details".SetFilter(Date, date2);
                if "Employee TimeSheet Details".FindFirst() then
                    date2 := "Employee TimeSheet Details".Date;
                "Employee TimeSheet Details".SetFilter("Emp Name", name2);
                if "Employee TimeSheet Details".FindFirst() then
                    name2 := "Employee TimeSheet Details"."Emp Name";
                "Employee TimeSheet Details".SetFilter(Year, Year2);
                if "Employee TimeSheet Details".Find() then
                    Year2 := "Employee TimeSheet Details".Year;
                "Employee Details".SetFilter("Emp Position", Position2);
                if "Employee Details".FindFirst() then
                    Position2 := "Employee Details"."Emp Position";



            end;




        }

    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {

    //             }
    //         }
    //     }

    // }



    procedure CopyVarible(var Month: Text[50]; var Date: text[50]; var Name: Text[50]; var Year: Text[50]; var Position: Text[50])

    begin
        Month2 := Month;
        date2 := Date;
        name2 := Name;
        Year2 := Year;
        Position2 := Position;


    end;


    var
        myInt: Integer;
        Month2: Text[50];
        date2: Text[50];
        name2: Text[50];
        Year2: text[50];
        Position2: Text[50];


}