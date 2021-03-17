table 55011 "Quality Specification Line"
{
    CaptionML = ENU='Quality Specification Line',KOR='QC 사양 라인';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            CaptionML = ENU='Document No.',KOR='사양문서 번호';
            DataClassification = CustomerContent;
            TableRelation = "Quality Specification Header"."Spec No.";
        }
        field(2;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',KOR='사양문서 라인';
            DataClassification = CustomerContent;
        }
        field(3; "Quality Measure"; Code[20])
        {
            CaptionML = ENU='Quality Measure',KOR='QC 측정항목';
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
            CaptionML = ENU='Measure Description',KOR='측정항목 적요';
            DataClassification = CustomerContent;
        }
        field(5; "Quality Method"; Code[20])
        {
            CaptionML = ENU='Quality Method',KOR='측정방법';
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
            CaptionML = ENU='Method Description',KOR='측정방법 적요';
            DataClassification = CustomerContent;
        }
        field(7; Conditions; Text[250])
        {
            CaptionML = ENU='Conditions',KOR='상태';
            DataClassification = CustomerContent;
        }
        field(8; "Result Type"; Enum "Quality Control Result Type")
        {
            CaptionML = ENU='Result Type',KOR='결과 유형';
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
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }
    
}
