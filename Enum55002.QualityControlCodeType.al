/// <summary>
/// QC 코드 유형을 정의합니다.
/// 측정항목과 방법을 선택합니다.
/// </summary>
enum 55002 "Quality Control Code Type"
{
    Extensible = true;
    
    value(0; Measure)
    {
        Caption = 'QC Measure';
    }
    value(1; Method)
    {
        Caption = 'QC Method';
    }
}
