page 50190 "Auto Caption"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {

            group(GroupName)
            {
                field("Table No"; "Table NO.")
                {
                    TableRelation = AllObj."Object id" where("Object Type" = const(Table));
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if "Table NO." <> 0 then begin

                            CustomerLedgerentryt("Table NO.");
                            Updatecaption(i);
                        end;

                    end;

                }
                field(varCaption; varCaption)
                {
                    CaptionClass = captionName;

                    ApplicationArea = all;

                    trigger OnValidate()
                    var

                    begin


                        //  CustomerLedgerentryt(18);
                        if varCaption <> '' then begin
                            Updatecaption(i);
                            varCaption := '';
                        end;
                        //Caption := varcaption;

                    end;


                }



            }


        }



    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        i := 1;
    end;


    local procedure CustomerLedgerentryt("Table ID": Integer)
    var

    begin
        i := 1;
        // fieldRef1 := MyRecordRef.Field(1);
        fieldTem.Reset();
        fieldTem.SetRange(TableNo, "Table ID");
        if fieldTem.FindSet() then
            repeat
                fieldArr[i] [1] := format(fieldTem."No.");
                fieldArr[i] [2] := fieldTem."Field Caption";
                i += 1;
            until fieldTem.Next() = 0;

        //  Message('%1', varCaption);

    end;

    local procedure Updatecaption(var i: Integer)
    var
        myInt: Integer;
    begin
        captionName := fieldArr[i] [2];
        i := i + 1;
    end;




    var
        captionName: Text;


        "Table NO.": Integer;
        i: Integer;
        fieldArr: array[500, 3] of Text[200];
        fieldTem: Record Field;
        varCaption: text;


}
