using { full_stack_app as my } from '../db/schema.cds';

@path: '/service/full_stack_app'
@requires: 'authenticated-user'
service full_stack_appSrv {
  @odata.draft.enabled
  entity SuperHeroes as projection on my.SuperHeroes;
  @odata.draft.enabled
  entity SecretIdentities as projection on my.SecretIdentities;
}