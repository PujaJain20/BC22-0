codeunit 50145 SampleCodeunit
{
    trigger OnRun()
    var
        customer: Record Customer;
        postfix: text;
        Ishandled: Boolean;

    begin
        postfix := ' AGT';
        customer.get('20000');

        onbeforemodifyCustomername(customer, Ishandled);
        customer.Name := customer.Name + postfix;
        if not Ishandled then
            Message('%1', customer.Name);
        customer.Modify();

    end;





    [IntegrationEvent(false, false)]
    local procedure onbeforemodifyCustomername(var Rec: Record Customer; var Ishandled: Boolean)
    begin
    end;

    var
        myInt: Integer;
        sales_line: Record "Sales Line";
        salesHeader: Record "Sales Header";
}
