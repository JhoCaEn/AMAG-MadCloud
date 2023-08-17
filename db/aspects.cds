
@readonly
@cds.autoexpose
@cds.persistence.skip : 'if-unused'
@cds.odata.valuelist
aspect CodeList {}


aspect replicated {
    createdAt               : DateTime @cds.on.insert : $now;
    modifiedAt              : DateTime @cds.on.insert : $now  @cds.on.update : $now;
}

aspect replicatedComposition {
    createdAt               : DateTime @cds.on.insert : $now;
}
