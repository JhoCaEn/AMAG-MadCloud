
@readonly
@cds.autoexpose
@cds.persistence.skip : 'if-unused'
@cds.odata.valuelist
@UI.Identification : [{Value : name}]
aspect CodeList {}


aspect replicated {
    createdAt               : DateTime @cds.on.insert : $now;
    modifiedAt              : DateTime @cds.on.insert : $now  @cds.on.update : $now;
}
