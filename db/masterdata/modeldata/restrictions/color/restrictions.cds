namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';

entity ModelColorRestrictions : replicated {
    key colorCombination : db.ModelColorCombination @assert.integrity: false;
    key type             : db.ColorType             @assert.integrity: false;
    key constraint       : String;
        constraints      : Composition of many db.ModelColorRestrictionConstraints
                               on constraints.restriction = $self;
        options          : Composition of many db.ModelColorRestrictionOptions
                               on options.restriction = $self;
};

type ModelColorRestriction : Association to ModelColorRestrictions;
