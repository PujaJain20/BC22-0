page 50107 StudentInfo
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentInfo;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;

                }

            }
        }

        area(Factboxes)
        {
            part(listpart; listpart)
            {
                //SubPageLink = Id = field(Id);
            }
            part(Cardpart; CardpartPage)
            {

            }
        }
    }







}