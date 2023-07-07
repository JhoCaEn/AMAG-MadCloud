using {retail.dwb as db} from '../../../../db';

annotate db.ModelColorCombinations with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ColorCombination}',
    TypeNamePlural: '{i18n>ColorCombinations}',
    Title         : {
        $Type: 'UI.DataField',
        Value: exterior_id
    }
}};