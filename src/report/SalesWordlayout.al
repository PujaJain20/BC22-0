report 50216 "Sales word layout"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'saleswordlayout.docx';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(PostingDate; PostingDate) { }

            trigger OnAfterGetRecord()
            var

            begin
                PostingDate := (Format("Posting Date", 0, '<day,2>-<month,2>-<year4>'));



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
        PostingDate: Text;
}