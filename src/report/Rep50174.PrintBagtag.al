report 50174 "PrintBagtag"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'PrintBagtag.rdl';
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");

                dataitem(copyloop; integer)
                {
                    DataItemTableView = SORTING(Number);
                    dataitem(Pageloop; integer)
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(Buy_from_Address; "Purchase Header"."Buy-from Address") { }
                        column(No_; "Purchase Header"."No.") { }
                        column(Your_Reference; "Purchase Header"."Your Reference") { }
                        column(Responsibility_Center; "Purchase Header"."Responsibility Center") { }
                        column(Status; "Purchase Header".Status) { }

                        column(No; "Purchase Line"."No.") { }
                        column(Description; "Purchase Line".Description) { }
                        column(OutputNo; OutputNo) { }
                        column(Quient; Quient) { }
                        column(Weight; Weight) { }
                        column(Quantity; "Purchase Line".Quantity) { }
                        column(BagTag; "Purchase Line".BagTag) { }
                        column(BasedOnmod; BasedOnmod) { }
                        column(ModOfBagtag; ModOfBagtag) { }
                    }
                    trigger OnAfterGetRecord()


                    begin
                        if Number > 1 then begin
                            CopyText := FormatDocument.GetCOPYText;
                            OutputNo += 1;
                        end;
                    end;

                    trigger OnPreDataItem()

                    begin
                        if NoOfCopies = 0 then begin
                            NoOfLoops := ABS(NoOfCopies) + BasedOnmod;
                            CopyText := '';
                            SETRANGE(Number, 1, NoOfLoops);
                            OutputNo := 1;
                        end
                        else
                            if NoOfCopies > 0 then begin
                                NoOfLoops := ABS(NoOfCopies) + 1;
                                CopyText := '';
                                SETRANGE(Number, 1, NoOfLoops);
                                OutputNo := 1;

                            end;
                    end;
                }
                trigger OnAfterGetRecord()

                begin
                    if NoOfCopies = 0 then begin
                        quient := (("Purchase Line".Quantity) DIV ("Purchase Line".BagTag));
                        ModOfBagtag := (("Purchase Line".Quantity) MOD ("Purchase Line".BagTag));
                        if ModOfBagtag = 0 then begin
                            BasedOnMod := Quient;

                        end;
                        if ModOfBagtag > 0 then begin
                            BasedOnmod := Quient + 1;
                        end;
                        Weight := ("Purchase Line".Quantity DIV "Purchase Line".BagTag);

                    end;

                end;
            }


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


    }
    var
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
        Quient: Integer;
        Weight: Decimal;
        ModOfBagtag: Decimal;
        BasedOnmod: Integer;
}