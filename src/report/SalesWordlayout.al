report 50216 "Sales word layout"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'saleswordlayout.docx';

    //AGT_PJ_03012023 ++
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(No_; "No.") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_Name; "Bill-to Name") { }
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


    //AGT_PJ_03012023 --
    var
        myInt: Integer;
        PostingDate: Text;
}