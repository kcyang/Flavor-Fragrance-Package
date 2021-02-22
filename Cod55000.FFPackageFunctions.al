/// <summary>
/// 향료 패키지에서, 기본으로 사용할 Procedure 들과, EventSubscriber 들을 정의합니다
/// </summary>
codeunit 55000 "FF Package Functions"
{
    // Sales Header 테이블에서, No Series 초기화하고, 가져갈 때,
    // 새로 추가된 Sample Request Nos 번호를 가져가도록 처리함.
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterGetNoSeriesCode', '', false, false)]
    local procedure OnAfterGetNoSeriesCode(var SalesHeader: Record "Sales Header"; SalesReceivablesSetup: Record "Sales & Receivables Setup"; var NoSeriesCode: Code[20])
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::"Sample Request" then
        begin
            NoSeriesCode := SalesReceivablesSetup."Sample Request Nos";
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
}
