namespace full_stack_app;
using { cuid } from '@sap/cds/common';

entity SuperHeroes : cuid {
  name: String(100) @assert.unique @mandatory;
  alias: String(100);
  gender: String(10);
  birthdate: Date;
  height: Decimal(5,2);
  weight: Decimal(5,2);
  superPowers: Composition of many SuperPowers on superPowers.superHero = $self;
  secretIdentity: Association to SecretIdentities;
}

entity SuperPowers : cuid {
  name: String(100) @assert.unique @mandatory;
  description: String(500);
  superHero: Association to SuperHeroes;
}

entity SecretIdentities : cuid {
  name: String(100) @assert.unique @mandatory;
  occupation: String(100);
  superHero: Association to SuperHeroes;
}

