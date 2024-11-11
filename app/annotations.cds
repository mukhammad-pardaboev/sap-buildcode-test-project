using { full_stack_appSrv } from '../srv/service.cds';

annotate full_stack_appSrv.SuperHeroes with @UI.HeaderInfo: { TypeName: 'Super Hero', TypeNamePlural: 'Super Heroes', Title: { Value: name } };
annotate full_stack_appSrv.SuperHeroes with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate full_stack_appSrv.SuperHeroes with @UI.Identification: [{ Value: name }];
annotate full_stack_appSrv.SuperHeroes with {
  secretIdentity @Common.ValueList: {
    CollectionPath: 'SecretIdentities',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: secretIdentity_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'occupation'
      },
    ],
  }
};
annotate full_stack_appSrv.SuperHeroes with {
  name @title: 'Name';
  alias @title: 'Alias';
  gender @title: 'Gender';
  birthdate @title: 'Birthdate';
  height @title: 'Height';
  weight @title: 'Weight'
};

annotate full_stack_appSrv.SuperHeroes with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: alias },
    { $Type: 'UI.DataField', Value: gender },
    { $Type: 'UI.DataField', Value: birthdate },
    { $Type: 'UI.DataField', Value: height },
    { $Type: 'UI.DataField', Value: weight },
    { $Type: 'UI.DataField', Label: 'Secret Identity', Value: secretIdentity_ID }
];

annotate full_stack_appSrv.SuperHeroes with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: alias },
    { $Type: 'UI.DataField', Value: gender },
    { $Type: 'UI.DataField', Value: birthdate },
    { $Type: 'UI.DataField', Value: height },
    { $Type: 'UI.DataField', Value: weight },
    { $Type: 'UI.DataField', Label: 'Secret Identity', Value: secretIdentity_ID }
  ]
};

annotate full_stack_appSrv.SuperHeroes with {
  secretIdentity @Common.Text: { $value: secretIdentity.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate full_stack_appSrv.SuperHeroes with {
  superPowers @Common.Label: 'Super Powers';
  secretIdentity @Common.Label: 'Secret Identity'
};

annotate full_stack_appSrv.SuperHeroes with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'SuperPowers', Target : 'superPowers/@UI.LineItem' }
];

annotate full_stack_appSrv.SuperHeroes with @UI.SelectionFields: [
  secretIdentity_ID
];

annotate full_stack_appSrv.SuperPowers with @UI.HeaderInfo: { TypeName: 'Super Power', TypeNamePlural: 'Super Powers', Title: { Value: name } };
annotate full_stack_appSrv.SuperPowers with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate full_stack_appSrv.SuperPowers with @UI.Identification: [{ Value: name }];
annotate full_stack_appSrv.SuperPowers with {
  superHero @Common.ValueList: {
    CollectionPath: 'SuperHeroes',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: superHero_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'alias'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'gender'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'birthdate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'height'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'weight'
      },
    ],
  }
};
annotate full_stack_appSrv.SuperPowers with {
  description @title: 'Description'
};

annotate full_stack_appSrv.SuperPowers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description }
];

annotate full_stack_appSrv.SuperPowers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate full_stack_appSrv.SuperPowers with {
  superHero @Common.Text: { $value: superHero.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate full_stack_appSrv.SuperPowers with {
  superHero @Common.Label: 'Super Hero'
};

annotate full_stack_appSrv.SuperPowers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate full_stack_appSrv.SuperPowers with @UI.SelectionFields: [
  superHero_ID
];

annotate full_stack_appSrv.SecretIdentities with @UI.HeaderInfo: { TypeName: 'Secret Identity', TypeNamePlural: 'Secret Identities', Title: { Value: name } };
annotate full_stack_appSrv.SecretIdentities with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate full_stack_appSrv.SecretIdentities with @UI.Identification: [{ Value: name }];
annotate full_stack_appSrv.SecretIdentities with {
  superHero @Common.ValueList: {
    CollectionPath: 'SuperHeroes',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: superHero_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'alias'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'gender'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'birthdate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'height'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'weight'
      },
    ],
  }
};
annotate full_stack_appSrv.SecretIdentities with {
  occupation @title: 'Occupation'
};

annotate full_stack_appSrv.SecretIdentities with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: occupation },
    { $Type: 'UI.DataField', Label: 'Super Hero', Value: superHero_ID }
];

annotate full_stack_appSrv.SecretIdentities with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: occupation },
    { $Type: 'UI.DataField', Label: 'Super Hero', Value: superHero_ID }
  ]
};

annotate full_stack_appSrv.SecretIdentities with {
  superHero @Common.Text: { $value: superHero.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate full_stack_appSrv.SecretIdentities with {
  superHero @Common.Label: 'Super Hero'
};

annotate full_stack_appSrv.SecretIdentities with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate full_stack_appSrv.SecretIdentities with @UI.SelectionFields: [
  superHero_ID
];

