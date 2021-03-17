/// <summary>
/// 향료 패키지에서, 기본으로 사용할 Procedure 들과, EventSubscriber 들을 정의합니다
/// </summary>
codeunit 55000 "FF Package Functions"
{
    //QC Required 항목을 Purchase Line 에 입력하기 위함.
    //Item 값이 입력된 후에, 입력됨.
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterAssignItemValues', '', false,false)]
    local procedure OnAfterAssignItemValues(var PurchLine: Record "Purchase Line"; Item: Record Item; CurrentFieldNo: Integer)
    var
        QCRequired: Record "Quality Control Requirements";
    begin
        QCRequired.Reset();
        QCRequired.SetRange("Item No.",Item."No.");
        if QCRequired.Find('-') then
            PurchLine."QC Required" := QCRequired."Quality Testing Required";
    end;
    //Sales Posting 이 마무리된 후에, 처리할 것들을 처리함.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean)
    var
        packingInformation: Record "Packing Information";
        SalesShptLine: Record "Sales Shipment Line";
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then 
        begin
            //code to somthing
            //Shipment Line 을 가져와서,
            //Packing Information 에 넣어주기.
            packingInformation.Reset();
            packingInformation.SetRange("Document Type",packingInformation."Document Type"::Sale);
            packingInformation.SetRange("Document No.",SalesHeader."No.");
            if packingInformation.FindSet() then
            begin
                repeat
                    SalesShptLine.Reset();
                    SalesShptLine.SetRange("Document No.",SalesShptHdrNo);
                    SalesShptLine.SetFilter("Order Line No.",'%1',packingInformation."Document Line No.");
                    if SalesShptLine.Find('-') then
                    begin
                        packingInformation."Posted Document No." := SalesShptHdrNo;
                        packingInformation."Posted Document Line No." := SalesShptLine."Line No.";
                        packingInformation.Modify();
                    end;
                until packingInformation.Next() = 0;
            end;
        end;

    end;
    //Purchase Posting 이 마무리 된 후에, 처리할 것들을 처리함.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure OnAfterPostPurchaseDoc(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean)
    var   
        packingInformation: Record "Packing Information";
        PurchRcptLine: Record "Purch. Rcpt. Line";    
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then 
        begin
            //code to somthing
            //Recpt. Line 을 가져와서,
            //Packing Information 에 넣어주기.        
            packingInformation.Reset();
            packingInformation.SetRange("Document Type",packingInformation."Document Type"::Purchase);
            packingInformation.SetRange("Document No.",PurchaseHeader."No.");
            if packingInformation.FindSet() then
            begin
                repeat
                    PurchRcptLine.Reset();
                    PurchRcptLine.SetRange("Document No.",PurchRcpHdrNo);
                    PurchRcptLine.SetFilter("Order Line No.",'%1',packingInformation."Document Line No.");
                    if PurchRcptLine.Find('-') then
                    begin
                        packingInformation."Posted Document No." := PurchRcpHdrNo;
                        packingInformation."Posted Document Line No." := PurchRcptLine."Line No.";
                        packingInformation.Modify();
                    end;
                until packingInformation.Next() = 0;
            end;   


            //QC Required 가 있는 경우, item ledger entry 에 QC Required 입력.
            PurchRcptLine.Reset();
            PurchRcptLine.SetRange("Document No.",PurchRcpHdrNo);
            PurchRcptLine.SetFilter(Type,'%1',PurchRcptLine.Type::Item);
            
            if PurchRcptLine.FindSet() then
            begin
                repeat
                    ItemLedgerEntry.Reset();
                    ItemLedgerEntry.SetCurrentKey("Document No.", "Document Type", "Document Line No.");
                    ItemLedgerEntry.SetRange("Document No.",PurchRcpHdrNo);
                    ItemLedgerEntry.SetRange("Document Type",ItemLedgerEntry."Document Type"::"Purchase Receipt");
                    ItemLedgerEntry.SetRange("Document Line No.",PurchRcptLine."Line No.");
                    ItemLedgerEntry.SetFilter("Item No.",PurchRcptLine."No.");
                    if ItemLedgerEntry.FindSet() then
                    begin
                        repeat
                            ItemLedgerEntry."QC Required" := PurchRcptLine."QC Required";
                            ItemLedgerEntry.Modify();
                        until ItemLedgerEntry.Next() = 0;
                    end;
                until PurchRcptLine.Next() = 0;
            end;
        end;
    end;
    // Sales Header 테이블에서, No Series 초기화하고, 가져갈 때,
    // 새로 추가된 Sample Request Nos 번호를 가져가도록 처리함.
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterGetNoSeriesCode', '', false, false)]
    local procedure OnAfterGetNoSeriesCode(var SalesHeader: Record "Sales Header"; SalesReceivablesSetup: Record "Sales & Receivables Setup"; var NoSeriesCode: Code[20])
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::"Sample Request" then begin
            NoSeriesCode := SalesReceivablesSetup."Sample Request Nos";
        end;
    end;
    //샘플요청서에서, 영업사원을 변경할 경우, Approval 관련오류처리, Sales Document Type의 Sample Request 항목을 처리해줘야 함.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Enum Assignment Management", 'OnGetSalesApprovalDocumentType', '', false, false)]
    local procedure OnGetSalesApprovalDocumentType(SalesDocumentType: Enum "Sales Document Type"; var ApprovalDocumentType: Enum "Approval Document Type"; var IsHandled: Boolean)
    begin
        if SalesDocumentType = SalesDocumentType::"Sample Request" then
        begin
            ApprovalDocumentType := "Approval Document Type"::"Sample Request";
            IsHandled := true;
        end;   
    end;
    //품목변경을 진행할 때, Sample Order 에서 Blanket Order No. 를 입력할 수 있도록 처리함.
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateBlanketOrderNo', '', false, false)]
    local procedure OnBeforeValidateBlanketOrderNo(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    var
        SalesSetup: Record "Sales & Receivables Setup";
        SalesLine2: Record "Sales Line";
    begin
        if SalesSetup.Get() then
        begin
            if xSalesLine."No." = SalesSetup."Sample Item No." then
            begin
                IsHandled := true;
                SalesLine."Blanket Order Line No." := xSalesLine."Blanket Order Line No.";
            end else 
            begin
                //원래 Blanket Order Line No. 에서 처리된 부분,
                IsHandled := true;
                SalesLine.TestField(SalesLine."Quantity Shipped", 0);
                if SalesLine."Blanket Order Line No." <> 0 then begin
                    SalesLine2.Get(SalesLine."Document Type"::"Blanket Order", SalesLine."Blanket Order No.", SalesLine."Blanket Order Line No.");
                    SalesLine2.TestField(Type, SalesLine.Type);
                    SalesLine2.TestField("No.", SalesLine."No.");
                    SalesLine2.TestField("Bill-to Customer No.", SalesLine."Bill-to Customer No.");
                    SalesLine2.TestField("Sell-to Customer No.", SalesLine."Sell-to Customer No.");
                    if SalesLine."Drop Shipment" then begin
                        SalesLine2.TestField("Variant Code", SalesLine."Variant Code");
                        SalesLine2.TestField("Location Code", SalesLine."Location Code");
                        SalesLine2.TestField("Unit of Measure Code", SalesLine."Unit of Measure Code");
                    end else begin
                        SalesLine.Validate("Variant Code", SalesLine2."Variant Code");
                        SalesLine.Validate("Location Code", SalesLine2."Location Code");
                        SalesLine.Validate("Unit of Measure Code", SalesLine2."Unit of Measure Code");
                    end;
                    SalesLine.Validate("Unit Price", SalesLine2."Unit Price");
                    SalesLine.Validate("Line Discount %", SalesLine2."Line Discount %");
                end;   
            end;
        end;
    end;
    //품목변경을 진행할 때, Sample Order에서 Line No. 가 진행되도록 blanket order 처리는 Blanket Order No. 처리하고, Line 부분은 스킵..
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateBlanketOrderLineNo', '', false, false)]
    local procedure OnBeforeValidateBlanketOrderLineNo(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
    //샘플요청서의 경우, 관련 주문서가 처리될 때, Blanket 으로 처리하되, Sample 관련문서로 처리되도록 이벤트를 선처리후,
    //샘플의 경우, 처리되면, 이후 Blanket 관련 프로세스는 건너뛰도록 isHandled -> True 처리함.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeUpdateBlanketOrderLine', '', false, false)]
    local procedure OnBeforeUpdateBlanketOrderLine(SalesLine: Record "Sales Line"; Ship: Boolean; Receive: Boolean; Invoice: Boolean; var IsHandled: Boolean)
    var
        BlanketOrderSalesLine: Record "Sales Line";
        xBlanketOrderSalesLine: Record "Sales Line";
        ModifyLine: Boolean;
        Sign: Decimal;
        UOMMgt: Codeunit "Unit of Measure Management";
        AsmPost: Codeunit "Assembly-Post";
        BlanketOrderQuantityGreaterThanErr: Label '샘플요청서의 수량이 %1보다 클수 없습니다.', Comment = '%1 = 수량';
        BlanketOrderQuantityReducedErr: Label '샘플요청서의 수량을 줄이시면 안됩니다.';
    begin
        IsHandled := false;
        if (SalesLine."Blanket Order No." <> '') and (SalesLine."Blanket Order Line No." <> 0) and
           ((Ship and (SalesLine."Qty. to Ship" <> 0)) or
            (Receive and (SalesLine."Return Qty. to Receive" <> 0)) or
            (Invoice and (SalesLine."Qty. to Invoice" <> 0)))
        then
            //Sample Request.
            if BlanketOrderSalesLine.Get(
                 BlanketOrderSalesLine."Document Type"::"Sample Request", SalesLine."Blanket Order No.",
                 SalesLine."Blanket Order Line No.")
            then begin
                BlanketOrderSalesLine.TestField(Type, SalesLine.Type);
                //Sample 과, 주문서상의 품목은 다르기 때문에, 의미가 없음.
                //BlanketOrderSalesLine.TestField("No.", SalesLine."No.");
                
                IsHandled := false;

                if not IsHandled then
                    BlanketOrderSalesLine.TestField("Sell-to Customer No.", SalesLine."Sell-to Customer No.");

                ModifyLine := false;
                case SalesLine."Document Type" of
                    SalesLine."Document Type"::Order,
                  SalesLine."Document Type"::Invoice:
                        Sign := 1;
                    SalesLine."Document Type"::"Return Order",
                  SalesLine."Document Type"::"Credit Memo":
                        Sign := -1;
                end;
                if Ship and (SalesLine."Shipment No." = '') then begin
                    xBlanketOrderSalesLine := BlanketOrderSalesLine;

                    if BlanketOrderSalesLine."Qty. per Unit of Measure" = SalesLine."Qty. per Unit of Measure" then
                        BlanketOrderSalesLine."Quantity Shipped" += Sign * SalesLine."Qty. to Ship"
                    else
                        BlanketOrderSalesLine."Quantity Shipped" +=
                          Sign *
                          Round(
                            (SalesLine."Qty. per Unit of Measure" /
                             BlanketOrderSalesLine."Qty. per Unit of Measure") * SalesLine."Qty. to Ship",
                            UOMMgt.QtyRndPrecision);
                    BlanketOrderSalesLine."Qty. Shipped (Base)" += Sign * SalesLine."Qty. to Ship (Base)";
                    ModifyLine := true;

                    AsmPost.UpdateBlanketATO(xBlanketOrderSalesLine, BlanketOrderSalesLine);
                end;
                if Receive and (SalesLine."Return Receipt No." = '') then begin
                    if BlanketOrderSalesLine."Qty. per Unit of Measure" =
                       SalesLine."Qty. per Unit of Measure"
                    then
                        BlanketOrderSalesLine."Quantity Shipped" += Sign * SalesLine."Return Qty. to Receive"
                    else
                        BlanketOrderSalesLine."Quantity Shipped" +=
                          Sign *
                          Round(
                            (SalesLine."Qty. per Unit of Measure" /
                             BlanketOrderSalesLine."Qty. per Unit of Measure") * SalesLine."Return Qty. to Receive",
                            UOMMgt.QtyRndPrecision);
                    BlanketOrderSalesLine."Qty. Shipped (Base)" += Sign * SalesLine."Return Qty. to Receive (Base)";
                    ModifyLine := true;
                end;
                if Invoice then begin
                    if BlanketOrderSalesLine."Qty. per Unit of Measure" =
                       SalesLine."Qty. per Unit of Measure"
                    then
                        BlanketOrderSalesLine."Quantity Invoiced" += Sign * SalesLine."Qty. to Invoice"
                    else
                        BlanketOrderSalesLine."Quantity Invoiced" +=
                          Sign *
                          Round(
                            (SalesLine."Qty. per Unit of Measure" /
                             BlanketOrderSalesLine."Qty. per Unit of Measure") * SalesLine."Qty. to Invoice",
                            UOMMgt.QtyRndPrecision);
                    BlanketOrderSalesLine."Qty. Invoiced (Base)" += Sign * SalesLine."Qty. to Invoice (Base)";
                    ModifyLine := true;
                end;

                if ModifyLine then begin
                    BlanketOrderSalesLine.InitOutstanding();
                    IsHandled := false;
                    if not IsHandled then begin
                        if (BlanketOrderSalesLine.Quantity * BlanketOrderSalesLine."Quantity Shipped" < 0) or
                           (Abs(BlanketOrderSalesLine.Quantity) < Abs(BlanketOrderSalesLine."Quantity Shipped"))
                        then
                            BlanketOrderSalesLine.FieldError(
                              "Quantity Shipped", StrSubstNo(BlanketOrderQuantityGreaterThanErr, BlanketOrderSalesLine.FieldCaption(Quantity)));
                        if (BlanketOrderSalesLine."Quantity (Base)" * BlanketOrderSalesLine."Qty. Shipped (Base)" < 0) or
                           (Abs(BlanketOrderSalesLine."Quantity (Base)") < Abs(BlanketOrderSalesLine."Qty. Shipped (Base)"))
                        then
                            BlanketOrderSalesLine.FieldError(
                              "Qty. Shipped (Base)",
                              StrSubstNo(BlanketOrderQuantityGreaterThanErr, BlanketOrderSalesLine.FieldCaption("Quantity (Base)")));
                        BlanketOrderSalesLine.CalcFields("Reserved Qty. (Base)");
                        if Abs(BlanketOrderSalesLine."Outstanding Qty. (Base)") < Abs(BlanketOrderSalesLine."Reserved Qty. (Base)") then
                            BlanketOrderSalesLine.FieldError(
                              "Reserved Qty. (Base)", BlanketOrderQuantityReducedErr);
                    end;

                    BlanketOrderSalesLine."Qty. to Invoice" :=
                      BlanketOrderSalesLine.Quantity - BlanketOrderSalesLine."Quantity Invoiced";
                    BlanketOrderSalesLine."Qty. to Ship" :=
                      BlanketOrderSalesLine.Quantity - BlanketOrderSalesLine."Quantity Shipped";
                    BlanketOrderSalesLine."Qty. to Invoice (Base)" :=
                      BlanketOrderSalesLine."Quantity (Base)" - BlanketOrderSalesLine."Qty. Invoiced (Base)";
                    BlanketOrderSalesLine."Qty. to Ship (Base)" :=
                      BlanketOrderSalesLine."Quantity (Base)" - BlanketOrderSalesLine."Qty. Shipped (Base)";

                    BlanketOrderSalesLine.Modify();
                end;
                IsHandled := true;
            end;

    end;
    /// <summary>
    /// 기본, Sample Request 문서에 대한 번호시리즈 셋팅입니다.
    /// </summary>
    /// <param name="DocNo">문서번호를 넘겨줍니다.</param>
    /// <returns>번호시리즈의 표시유무</returns>
    procedure SalesDocumentNoIsVisible(DocNo: Code[20]): Boolean
    var
        NoSeries: Record "No. Series";
        SalesNoSeriesSetup: Page "Sales No. Series Setup";
        DocNoSeries: Code[20];
        IsHandled: Boolean;
        IsVisible: Boolean;
    begin
        IsHandled := false;
        IsVisible := false;

        if IsHandled then
            exit(IsVisible);

        if DocNo <> '' then
            exit(false);

        DocNoSeries := DetermineSalesSeriesNo();

        if not NoSeries.Get(DocNoSeries) then begin
            Error('샘플요청에 대한 번호시리즈가 정의되지 않았습니다.\먼저 번호시리즈를 정의하세요.');
        end;

        exit(ForceShowNoSeriesForDocNo(DocNoSeries));
    end;
    /// <summary>
    /// 내부 사용 SalesDocumentNoIsVisibled에서 사용합니다.
    /// </summary>
    /// <returns></returns>
    local procedure DetermineSalesSeriesNo(): Code[20]
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesHeader: Record "Sales Header";
    begin
        SalesReceivablesSetup.Get();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Sample Request");
        CheckNumberSeries(SalesHeader, SalesReceivablesSetup."Sample Request Nos", SalesHeader.FieldNo("No."));
        exit(SalesReceivablesSetup."Sample Request Nos");
    end;

    /// <summary>
    /// 내부 사용 SalesDocumentNoIsVisibled에서 사용합니다.
    /// </summary>
    /// <returns></returns>    
    procedure ForceShowNoSeriesForDocNo(NoSeriesCode: Code[20]): Boolean
    var
        NoSeries: Record "No. Series";
        NoSeriesRelationship: Record "No. Series Relationship";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SeriesDate: Date;
    begin
        if not NoSeries.Get(NoSeriesCode) then
            exit(true);

        SeriesDate := WorkDate;
        NoSeriesRelationship.SetRange(Code, NoSeriesCode);
        if not NoSeriesRelationship.IsEmpty then
            exit(true);

        if NoSeries."Manual Nos." or (NoSeries."Default Nos." = false) then
            exit(true);

        exit(NoSeriesMgt.DoGetNextNo(NoSeriesCode, SeriesDate, false, true) = '');
    end;

    /// <summary>
    /// 내부 사용 SalesDocumentNoIsVisibled에서 사용합니다.
    /// </summary>
    /// <returns></returns>    
    procedure CheckNumberSeries(RecVariant: Variant; NoSeriesCode: Code[20]; FieldNo: Integer)
    var
        NoSeries: Record "No. Series";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RecRef: RecordRef;
        FieldRef: FieldRef;
        NewNo: Code[20];
    begin
        if RecVariant.IsRecord and (NoSeriesCode <> '') and NoSeries.Get(NoSeriesCode) then begin
            NewNo := NoSeriesMgt.DoGetNextNo(NoSeriesCode, 0D, false, true);
            RecRef.GetTable(RecVariant);
            FieldRef := RecRef.Field(FieldNo);
            FieldRef.SetRange(NewNo);
            if RecRef.FindFirst then begin
                NoSeriesMgt.SaveNoSeries;
                CheckNumberSeries(RecRef, NoSeriesCode, FieldNo);
            end;
        end;
    end;

    procedure makeSampletoOrder(var Rec: Record "Sales Header")
    var
        CreateConfirmQst: Label '샘플요청서에서 샘플주문서를 생성하시겠습니까?';
        OrderCreatedMsg: Label '샘플주문서 <%1>가 샘플요청서 <%2>에서 생성되었습니다.', Comment = '%1 = Sample Request No., %2 = Sample Order No.';
        SalesOrderHeader: Record "Sales Header";
        SampleSalesOrderToOrder: Codeunit "Sample Request to Order";
        SkipMessage: Boolean;
    begin
        if GuiAllowed then
            if not Confirm(CreateConfirmQst, false) then
                exit;
        SampleSalesOrderToOrder.Run(Rec);
        SampleSalesOrderToOrder.GetSalesOrderHeader(SalesOrderHeader);

        if not SkipMessage then
            Message(OrderCreatedMsg, SalesOrderHeader."No.", Rec."No.");
    end;
    procedure BlankZero(Number: Decimal): Text
    begin
        if Number <> 0 then
            exit(Format(Number,0,'<Sign><Integer Thousand><Decimals>'))
        else
            exit('');
    end;

    procedure BlankZeroFormatted(NumberFormatted: Text) : Text
    var 
        Number: Integer;
    begin
        if Evaluate(Number,NumberFormatted) AND (Number = 0) then
            exit('')
        else
            exit(NumberFormatted);
    end;
}
