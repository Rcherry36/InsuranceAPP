namespace insuranceApp;

//using { cuid, managed } from '@sap/cds/common';

/* 1️⃣  Customer Information */
entity Customers  {
    key id:Integer;
    firstName   : String ;
    lastName    : String;
    email       : String ;
    phone       : String;
    address     : String ;
    dateOfBirth : Date;

    // Relationships
    policies : Composition of many Policies on policies.customer = $self;
}

/* 2️⃣  Insurance Policy Details */
entity Policies {
    key id:Integer;
    policyNumber : String ;
    policyType   : String ;
    startDate    : Date;
    endDate      : Date;
    premiumAmount: Integer;
    status       : String ;

    // Relationships
    customer : Association to Customers;
    agent    : Association to Agents;
    claims   : Composition of many Claims on claims.policy = $self;
    payments : Composition of many Payments on payments.policy = $self;
}

/* 3️⃣  Insurance Agent Details */
entity Agents  {key id:Integer;
    name        : String;
    email       : String;
    phone       : String;
    branch      : String;
    experience  : Integer;

    // One agent can handle many policies
    policies : Association to many Policies on policies.agent = $self;
}

/* 4️⃣  Claims Raised for Policies */
entity Claims  {
    key id:Integer;
    claimNumber : String;
    claimDate   : Date;
    claimAmount : Integer;
    status      : String;
    description : String;

    // Relationships
    policy  : Association to Policies;
}

/*   Payments for Policies */
entity Payments  {
    key id:Integer;
    paymentDate  : Date;
    paymentMode  : String;
    amountPaid   : Integer;
    transactionId: String;

    // Relationship
    policy  : Association to Policies;
}