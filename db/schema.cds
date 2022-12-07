namespace sap.ui.riskmanagement;
using { managed } from '@sap/cds/common';

  entity Risks : managed {
    key ID      : UUID  @(Core.Computed : true);
    title       : String(100);
    prio        : String(5);
    descr       : String;
    miti        : Association to Mitigations;
    impact      : Integer;
    criticality : Integer;
  }

  entity Mitigations : managed {
    key ID       : UUID  @(Core.Computed : true);
    description  : String;
    owner        : String;
    timeline     : String;
    imply        : Association to Results;
    risks        : Association to many Risks on risks.miti = $self;
  }

  entity Results : managed {
    key ID       : UUID  @(Core.Computed : true);
    description  : String;
    implication  : String(10);
    owner        : String;
    timeline     : String;
    rationale    : Association to many Mitigations on rationale.imply = $self;
  }
