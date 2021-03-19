table 55013 "Quality Test Line"
{
    CaptionML = ENU='Quality Test Line',KOR='품질테스트 라인';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            CaptionML = ENU='Document No.',KOR='문서 번호';
            DataClassification = CustomerContent;
            TableRelation = "Quality Test Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            CaptionML = ENU='Line No.',KOR='라인 번호';
            DataClassification = CustomerContent;
        }
        field(3; "Quality Measure"; Code[20])
        {
            CaptionML = ENU='Quality Measure',KOR='품질측정항목';
            DataClassification = CustomerContent;
            TableRelation = "Quality Control Code".Code where(Type = const(Measure));
            
            trigger OnValidate()
            var 
                QC: Record "Quality Control Code";
            begin
                if (xRec."Quality Measure" <> Rec."Quality Measure") AND
                (Rec."Quality Measure" <> '') then
                begin
                    QC.Reset();
                    QC.SetRange(Type,QC.Type::Measure);
                    QC.SetRange(Code,"Quality Measure");
                    if QC.Find('-') then
                    begin
                        Validate("Measure Description",QC.Description);
                        Validate("Result Type",QC."Result Type");
                    end;
                end;
            end;            
        }
        field(4; "Measure Description"; Text[250])
        {
            CaptionML = ENU='Measure Description',KOR='품질측정항목명';
            DataClassification = CustomerContent;
        }
        field(5; "Quality Method"; Code[20])
        {
            CaptionML = ENU='Quality Method',KOR='품질측정방법';
            DataClassification = CustomerContent;
            TableRelation = "Quality Control Code".Code where(Type = const(Method));
            trigger OnValidate()
            var 
                QC: Record "Quality Control Code";
            begin
                if (xRec."Quality Method" <> Rec."Quality Method") AND
                (Rec."Quality Method" <> '') then
                begin
                    QC.Reset();
                    QC.SetRange(Type,QC.Type::Method);
                    QC.SetRange(Code,"Quality Method");
                    if QC.Find('-') then
                    begin
                        Validate("Method Description",QC.Description);
                    end;
                        
                end;  
            end;              
        }
        field(6; "Method Description"; Text[250])
        {
            CaptionML = ENU='Method Description',KOR='품질측정방법명';
            DataClassification = CustomerContent;
        }
        field(7; Conditions; Text[250])
        {
            CaptionML = ENU='Conditions',KOR='조건';
            DataClassification = CustomerContent;
        }
        field(8; "Result Type"; Enum "Quality Control Result Type")
        {
            CaptionML = ENU='Result Type',KOR='결과유형';
            DataClassification = CustomerContent;
        }
        field(9; "Lower Limit"; Decimal)
        {
            CaptionML = ENU='Lower Limit',KOR='최저치';
            DataClassification = CustomerContent;
        }
        field(10; "Upper Limit"; Decimal)
        {
            CaptionML = ENU='Upper Limit',KOR='최대치';
            DataClassification = CustomerContent;
        }
        field(11; "Nominal Value"; Decimal)
        {
            CaptionML = ENU='Nominal Value',KOR='정상값';
            DataClassification = CustomerContent;
        }
        field(12; "Actual Measure"; Decimal)
        {
            CaptionML = ENU='Actual Measure',KOR='실 측정치';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if xRec."Actual Measure" <> Rec."Actual Measure" then
                begin
                    Rec."Test Completion" := true;
                    Rec."Test Date" := Today;
                    Modify()
                end;
                MeasuretheValue();
            end;
        }
        field(13; Result; Code[20])
        {
            CaptionML = ENU='Result',KOR='결과(목록)';
            DataClassification = CustomerContent;
            TableRelation = "Quality Control Option"."Option Code" where ("Measure Code" = field("Quality Measure"));
            trigger OnValidate()
            begin
                if xRec.Result <> Rec.Result then
                begin
                    Rec."Test Completion" := true;
                    Rec."Test Date" := Today;
                    Modify();
                end;
                MeasuretheValue();
            end;
        }
        field(14; "Non Compliance"; Boolean)
        {
            CaptionML = ENU='Non Compliance',KOR='부적합';
            DataClassification = CustomerContent;
        }
        field(15; Comments; Boolean)
        {
            Editable = false;
            CaptionML = ENU='Comments',KOR='코멘트';
            DataClassification = CustomerContent;
        }
        field(16; "Test Completion"; Boolean)
        {
            CaptionML = ENU='Test Completion',KOR='테스트 완료';
            DataClassification = CustomerContent;
        }
        field(17; "Test Date"; Date)
        {
            CaptionML = ENU='Test Date',KOR='테스트 일자';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    /// <summary>
    /// 이미 정의된, Specification limit 에 맞춰
    /// 값이 정상치에 해당하는지 여부를 기록합니다.
    /// </summary>
    local procedure MeasuretheValue()
    var
        QCOption: Record "Quality Control Option";
    begin
        //Option 유형인 경우, Quality Control Option 에서 값을 처리함.
        if "Result Type" = "Result Type"::QCOption then 
        begin
            if Result <> '' then
            begin
                QCOption.Reset();
                QCOption.SetRange("Measure Code","Quality Measure");
                QCOption.SetRange("Option Code",Result);
                if QCOption.Find('-') then
                begin
                    if QCOption.Pass = false then
                        "Non Compliance" := true
                    else
                        "Non Compliance" := false;
                end else
                    Error('입력된 결과 값이 QC 설정에 없는 값입니다. 먼저 설정에서 정의해 주세요.');
            end;
        end else 
        begin
            //번호인 경우, Min Max 로 확인하도록 함.
            if ("Lower Limit" > "Actual Measure") OR
            ("Upper Limit" < "Actual Measure") then
                "Non Compliance" := true
            else
                "Non Compliance" := false;
        end;
    end;    
}
