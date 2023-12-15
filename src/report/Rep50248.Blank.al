report 50248 Blank
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'AGTSalesConfirmationwc.rdl';

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            column(No_; "No.")
            {
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
            column(Shipment_Date; "Shipment Date") { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Address; "Bill-to Address" + ', ' + "Bill-to Address 2") { }
            column(Bill_to_Address_2; "Bill-to Address 2") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_County; "Bill-to County") { }
            column(Bill_to_Post_Code; "Bill-to Post Code") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_County; "Ship-to County") { }
            column(Ship_to_City; "Ship-to City" + ', ' + "Ship-to Post Code") { }

            column(External_Document_No_; "External Document No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Order_No_; "Order No.") { }
            column(Salesperson_Code; "Salesperson Code") { }
            column(salesPersonName; salesPersonName) { }
            column(DescriptionMethod; DescriptionMethod) { }

            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(Quantity; Quantity) { }
                column(Quantity_Invoiced; "Quantity Invoiced") { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Description; Description) { }
                column(No; "No.") { }
                column(Type; Type) { }
                column(Line_No_; "Line No.") { }
                column(ordered; ordered) { }
                column(BackOrdered; BackOrdered) { }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    ordered := 0;
                    BackOrdered := 0;
                    salesline.Reset();
                    salesline.SetRange("Document Type", salesline."Document Type"::Order);
                    salesline.SetRange("Document No.", "Sales Shipment Header"."Order No.");
                    salesline.SetRange("Line No.", "Sales Shipment Line"."Order Line No.");
                    if salesline.FindSet() then
                        repeat
                            BackOrdered := salesline."Outstanding Quantity";
                            ordered := salesline.Quantity;
                        until salesline.next = 0;
                end;


            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin

                Clear(salesPersonName);

                if salesPerson.Get("Sales Shipment Header"."Salesperson Code") then begin
                    salesPersonName := salesPerson.Name;
                end;
                if ShipmentMethod.Get("Sales Shipment Header"."Shipment Method Code") then begin
                    DescriptionMethod := ShipmentMethod.Description;

                end;







            end;





        }
    }
    requestpage
    {


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
    labels
    {
        ExternalDocNumber = 'External Document No.';
        BilltoCustomerNumber = 'Bill-to Customer No.';
        OrderNumber = 'Order No.';
        QuoteNumber = 'Quote No.';
        DocumentDate = 'Document Date';
        PaymentTerms = 'Payment Terms';
        ShippingMethod = 'Shipping Method';
        PaymentMethod = 'Payment Method';
    }


    var
        salesPersonName: Text[50];
        salesPerson: Record "Salesperson/Purchaser";
        ShipmentMethod: Record "Shipment Method";
        DescriptionMethod: Text[100];
        Salesheader: Record "Sales Header";
        ordered: Decimal;
        salesline: Record "Sales Line";
        BackOrdered: Decimal;
        Temp: Decimal;


}