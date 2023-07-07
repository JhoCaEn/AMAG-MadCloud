using {retail.dwb as db} from '../../../../db';

annotate db.ModelColorRestrictionOptions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ColorRestrictionOption}',
    TypeNamePlural: '{i18n>ColorRestrictionOption}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};