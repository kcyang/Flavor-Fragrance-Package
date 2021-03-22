/// <summary>
/// QC 결과 유형을 정의합니다.
/// </summary>
enum 55003 "Quality Control Result Type"
{
    Extensible = true;
    
    value(0; Number)
    {
        Caption = 'Number';
    }
    value(1; QCOption)
    {
        Caption = 'Option';
    }
    value(2; Condition)
    {
        Caption = 'Condition';
    }
    
}
