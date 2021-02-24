pageextension 55002 "Sales Order Subform Ext." extends "Sales Order Subform"
{
    actions
    {
        addlast("O&rder")
        {
            //판매주문의 라인에서, 해당라인에 연관된 샘플요청서를 오픈할 수 있도록 한다.
            action(SampleRequest)
            {
                ApplicationArea = Suite;
                CaptionML = ENU='Sample Request',KOR='샘플요청서';
                Image = NewOrder;
                ToolTipML = ENU='View the Sample request.',KOR='연관된 샘플요청서 보기';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    SampleRequestPage: Page "Sales Sample Request";
                begin
                    TestField("Blanket Order No.");
                    SalesHeader.SetRange("No.", "Blanket Order No.");
                    if not SalesHeader.IsEmpty then begin
                        SampleRequestPage.SetTableView(SalesHeader);
                        SampleRequestPage.Editable := false;
                        SampleRequestPage.Run();
                    end;
                end;
            }
        }
    }
}
